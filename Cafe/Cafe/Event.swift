//
//  Event.swift
//  Cafe
//
//  Created by Byoung_wook on 2022/04/07.
//

import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    
    let image: Image
    let title: String
    let description: String
    
    static let sample: [Event] = [
    Event(image: Image("coffee"), title: "제주도 한정 메뉴", description: "제주도의 감귤맛입니다. 꼭 드셔보세요!"),
    Event(image: Image("coffee"), title: "봄 한정 메뉴", description: "제주도의 딸기맛입니다. 꼭 드셔보세요!")
    ]
}
