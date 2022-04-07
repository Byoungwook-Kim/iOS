//
//  CoffeeMenu.swift
//  Cafe
//
//  Created by Byoung_wook on 2022/04/07.
//

import SwiftUI

struct CoffeeMenu: Identifiable{
    let image: Image
    let name: String
    let id = UUID()
    
    
    static let sample: [CoffeeMenu] = [
        CoffeeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "바닐라라뗴"),
        CoffeeMenu(image: Image("coffee"), name: "핫초코"),
        CoffeeMenu(image: Image("coffee"), name: "카페모카"),
        CoffeeMenu(image: Image("coffee"), name: "드립커피"),
        CoffeeMenu(image: Image("coffee"), name: "아이스아메리카노"),
    ]
}
