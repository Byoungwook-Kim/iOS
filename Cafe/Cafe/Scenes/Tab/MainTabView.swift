//
//  MainTabView.swift
//  Cafe
//
//  Created by Byoung_wook on 2022/04/05.
//

import SwiftUI


struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Tab.home.imageItem
                    Tab.home.textItem
                }
            OtherView()
                .tabItem {
                    Tab.other.imageItem
                    Tab.other.textItem
                }
        }
    }
}

struct SampleHStack_PreViews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
