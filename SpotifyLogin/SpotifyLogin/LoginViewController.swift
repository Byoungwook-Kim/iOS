//
//  LoginViewController.swift
//  SpotifyLogin
//
//  Created by Byoung_wook on 2022/10/31.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
}
