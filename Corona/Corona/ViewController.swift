//
//  ViewController.swift
//  Corona
//
//  Created by Byoung_wook on 2021/12/01.
//
import Alamofire
import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var indicater: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicater.startAnimating()
        self.fetchCovidOverview(completionHandler: {[weak self] result in
            guard let self = self else {return}
            self.indicater.stopAnimating()
            self.indicater.isHidden = true
            self.labelStackView.isHidden = false
            self.pieChartView.isHidden = false
            switch result {
            case let .success(result):
                self.configureStackView(koreaCovidOverview: result.korea)
                let covidOverviewList = self.makeCovidOverviewList(cityCovidOverView: result)
                self.configureChartView(CovidOverViewList: covidOverviewList)
                
            case let .failure(error):
                debugPrint(error)
            }
        })
    }
    func makeCovidOverviewList(
        cityCovidOverView: CityCovidOverView) -> [CovidOverView] {
            return [
                cityCovidOverView.seoul,
                cityCovidOverView.busan,
                cityCovidOverView.daegu,
                cityCovidOverView.incheon,
                cityCovidOverView.gwangju,
                cityCovidOverView.daejeon,
                cityCovidOverView.ulsan,
                cityCovidOverView.sejong,
                cityCovidOverView.gyeonggi,
                cityCovidOverView.chungbuk,
                cityCovidOverView.chungnam,
                cityCovidOverView.gyeongbuk,
                cityCovidOverView.gyeongnam,
                cityCovidOverView.jeju,
            ]
        }
    
    func configureChartView(CovidOverViewList: [CovidOverView]) {
        self.pieChartView.delegate = self
        let entries = CovidOverViewList.compactMap { [weak self] overview -> PieChartDataEntry? in
            guard let self = self else {return nil}
            return PieChartDataEntry(value: self.removeFormatString(string: overview.newCase), label: overview.countryName, data: overview
            )
        }
        
        let dataSet = PieChartDataSet(entries: entries, label: "현황")
        dataSet.sliceSpace = 1
        dataSet.entryLabelColor = .black
        dataSet.valueTextColor = .black
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3
        
        dataSet.colors = ChartColorTemplates.vordiplom() +
        ChartColorTemplates.joyful() + ChartColorTemplates.liberty() + ChartColorTemplates.pastel() + ChartColorTemplates.material()
        
        self.pieChartView.data = PieChartData(dataSet: dataSet)
        self.pieChartView.spin(duration: 0.3, fromAngle: self.pieChartView.rotationAngle, toAngle: self.pieChartView.rotationAngle + 80)
    }
    
    func removeFormatString(string: String) -> Double{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    func configureStackView(koreaCovidOverview: CovidOverView){
        self.totalCaseLabel.text = "\(koreaCovidOverview.totalCase)명"
        self.newCaseLabel.text = "\(koreaCovidOverview.newCase)명"
    }
    
    func fetchCovidOverview(
        completionHandler: @escaping (Result<CityCovidOverView, Error>) -> Void
    ) {
        let url = "https://api.corona-19.kr/korea/country/new"
        let param = [
            "serviceKey": "QJNm8AbXFpwcarnquYB3hD2leStykfVgR"
        ]
        
        AF.request(url, method: .get, parameters: param).responseData(completionHandler: { response in
            switch response.result {
            case let .success(data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(CityCovidOverView.self, from: data)
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(error))
                }
                
            case let .failure(error):
                completionHandler(.failure(error))
            }
        })
    }
}

extension ViewController:ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let covidDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "CovidDetailViewController") as? CovidDetailViewController else { return }
        guard let covidOverview = entry.data as? CovidOverView else { return }
        covidDetailViewController.covidOverview = covidOverview
        self.navigationController?.pushViewController(covidDetailViewController, animated: true)
    }
}
