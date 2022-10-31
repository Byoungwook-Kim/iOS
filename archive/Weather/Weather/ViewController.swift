//
//  ViewController.swift
//  Weather
//
//  Created by Byoung_wook on 2021/11/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weatherStackView: UIStackView!
    @IBOutlet var cityNameTextField: UITextField!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var weatherDiscriptionLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tapFetchWeatherButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func configureView(weatherInfomation: WeatherInformation) {
        self.cityNameLabel.text = weatherInfomation.name
        if let weather = weatherInfomation.weather.first {
            self.weatherDiscriptionLabel.text = weather.description
        }
        self.tempLabel.text = "\(Int(weatherInfomation.temp.temp - 273.15))°C"
        self.minTempLabel.text = "최저: \(Int(weatherInfomation.temp.minTemp - 273.15))°C"
        self.maxTempLabel.text = "최고: \(Int(weatherInfomation.temp.maxTemp - 273.15))°C"
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "에러", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=bdb00b0454b041a8343d8206957bc633") else {return }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self]data, response, error in
            let successRange = (200..<300)
            guard let data = data, error == nil else {return}
            let decoder = JSONDecoder()
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else {return}
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configureView(weatherInfomation: weatherInformation)
            }
            
            } else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else {return}
                DispatchQueue.main.async {
                    self?.showAlert(message: errorMessage.massage)
                }
            }
            
        }.resume()
    }
}

