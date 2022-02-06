//
//  RoundButton.swift
//  Calculator
//
//  Created by Byoung_wook on 2021/11/25.
//

import UIKit


@IBDesignable
class RoundButton: UIButton {
   @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
