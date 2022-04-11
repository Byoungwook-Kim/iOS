//
//  HomeViewModel.swift
//  Cafe
//
//  Created by Byoung_wook on 2022/04/11.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isNeedToReload = false {
        didSet {
            guard isNeedToReload else { return }

                coffeeMenu.shuffle()
                events.shuffle()
                
                isNeedToReload = false
        }
    }
    
    @Published var coffeeMenu: [CoffeeMenu] = [
        CoffeeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "바닐라라뗴"),
        CoffeeMenu(image: Image("coffee"), name: "핫초코"),
        CoffeeMenu(image: Image("coffee"), name: "카페모카"),
        CoffeeMenu(image: Image("coffee"), name: "드립커피"),
        CoffeeMenu(image: Image("coffee"), name: "아이스아메리카노"),
    ]
    
   @Published var events: [Event] = [
   Event(image: Image("coffee"), title: "제주도 한정 메뉴", description: "제주도의 감귤맛입니다. 꼭 드셔보세요!"),
   Event(image: Image("coffee"), title: "봄 한정 메뉴", description: "제주도의 딸기맛입니다. 꼭 드셔보세요!")
   ]
}
