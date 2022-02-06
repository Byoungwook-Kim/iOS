//
//  CSStepper.swift
//  Chapter03-CSStepper
//
//  Created by Byoung_wook on 2021/08/31.
//

import UIKit
@IBDesignable

class CSStepper: UIView {
    
    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerLabel = UILabel()
    
    public var value: Int = 0 {
        didSet {
            self.centerLabel.text = String(value)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        
        self.leftBtn.tag = -1
        self.leftBtn.setTitle("⬇︎", for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.leftBtn.layer.borderWidth = 0.5
        self.leftBtn.layer.borderColor = UIColor.blue.cgColor
        
        self.rightBtn.tag = 1
        self.rightBtn.setTitle("⬆︎", for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.rightBtn.layer.borderWidth = 0.5
        self.rightBtn.layer.borderColor = UIColor.blue.cgColor
        
        self.centerLabel.text = String(value)
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = UIColor.cyan
        self.centerLabel.layer.borderWidth = 0.5
        self.centerLabel.layer.borderColor = UIColor.blue.cgColor
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLabel)
        
        self.leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        
    }
    
    @objc public func valueChange(_ sender: UIButton){
        self.value += sender.tag
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let btnWidth = self.frame.height
        
        let lblWidth = self.frame.width - (btnWidth * 2)
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.centerLabel.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
        self.rightBtn.frame = CGRect(x: btnWidth+lblWidth, y: 0, width: btnWidth, height: btnWidth)
    }
}
