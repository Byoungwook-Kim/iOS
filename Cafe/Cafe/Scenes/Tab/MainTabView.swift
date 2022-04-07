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
            Text("Home")
                .tabItem {
                    Tab.home.imageItem
                    Tab.home.textItem
                }
            Text("Other")
                .tabItem {
                    Tab.other.imageItem
                    Tab.other.textItem
                }
        }
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}

//HStack

struct SampleLazyHStack: View {
    struct Number: Identifiable {
        let value: Int
        var id: Int {value}
    }
    let numbers: [Number] = (0...100).map { Number(value: $0 ) }
    var body: some View {
        ScrollView(.horizontal) {
        LazyHStack {
            ForEach(numbers) { number in
                Text("\(number.value)") 
            }
            
        }
        }
    }
}

struct SampleListHStack: View {
    struct Number: Identifiable {
        let value: Int
        var id: Int {value}
    }
    let numbers: [Number] = (0...100).map { Number(value: $0 ) }
    var body: some View {
        List {
            Section(header: Text("Header")) {
            ForEach(numbers) {
                number in Text("\(number.value)")
            }
            }
            
            Section(header: Text("Header"), footer: Text("Footer")) {
            ForEach(numbers) {
                number in Text("\(number.value)")
            }
            }
        }
    }
}

struct SampleHStack_PreViews: PreviewProvider {
    static var previews: some View {
        SampleListHStack()
    }
}
