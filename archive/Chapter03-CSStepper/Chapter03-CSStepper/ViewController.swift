//
//  ViewController.swift
//  Chapter03-CSStepper
//
//  Created by Byoung_wook on 2021/08/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        self.view.addSubview(stepper)
    }


}

