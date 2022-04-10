//
//  User.swift
//  Cafe
//
//  Created by Byoung_wook on 2022/04/08.
//

import Foundation

struct User {
    let username: String
    let account: String
    
    static let shared = User(username: "김병욱", account: "liam.kn")
}
