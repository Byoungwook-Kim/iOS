//
//  ViewController.swift
//  Generater
//
//  Created by Byoung_wook on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    let quotes = [
    Quote(contents: "명언1", name: "작성자1"),
        Quote(contents: "명언2", name: "작성자2"),
        Quote(contents: "명언3", name: "작성자3"),
        Quote(contents: "명언4", name: "작성자4"),
        Quote(contents: "명언5", name: "작성자5"),
    ]
    
    @IBAction func generatorButton(_ sender: Any) {
        let random = Int(arc4random_uniform(5))
        let quote = quotes[random]
        self.textLabel.text = quote.contents
        self.name.text = quote.name
    }
    
}

