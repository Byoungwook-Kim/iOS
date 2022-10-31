//
//  ViewController.swift
//  Chapter08-APITest
//
//  Created by Byoung_wook on 2021/10/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentTime: UILabel!
    
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBAction func callCurrenTime(_ sender: Any) {
        do {
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
            let response = try String(contentsOf: url!)
            
            self.currentTime.text = response
            self.currentTime.sizeToFit()
        } catch let e as NSError {
            print(e.localizedDescription)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func post(_ sender: Any) {
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = "userId=\(userId)&name=\(name)"
        let paramData = param.data(using: .utf8)
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Length")
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in if let e = error {
            NSLog("an error has occurred: \(e.localizedDescription)")
            return
        }
        task.resume()
        }
    }
    
    @IBOutlet weak var responseView: UITextView!
}

