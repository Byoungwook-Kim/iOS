//
//  RevealViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by Byoung_wook on 2021/09/01.
//

import UIKit

class RevealViewController: UIViewController {
    
    var contentVC: UIViewController?
    var sideVC: UIViewController?
    var isSideBarShowing = false
    let SLIDE_TIME = 0.3
    let SIDEBAR_WIDTH: CGFloat = 260

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController {
            self.contentVC = vc
            self.addChild(vc)
            self.view.addSubview(vc.view)
            vc.didMove(toParent: self)
        }
        
    }
    
    func getSideView() {
        
    }
    
    func setShadowEffect(shadow: Bool, offset: CGFloat) {
        
    }
    
    func openSideBar(_ complete: (() -> Void? )) {
        
    }
    
    func closeSideBar(_ complete: (() -> Void? )) {
        
    }
}
