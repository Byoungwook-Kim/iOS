//
//  MenuSuggestionSectionView.swift
//  Cafe
//
//  Created by Byoung_wook on 2022/04/07.
//

import SwiftUI

struct MenuSuggestionSectionView: View {
    var body: some View {
        VStack {
            Text("\(User.shared.username)님을 위한 추천메뉴")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,16.0)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(CoffeeMenu.sample) { menu in
                        MenuSuggestionItemView(coffeMenu: menu)
                    }
                    
                }
                .padding(.horizontal,16.0)
            }
        }
    }
}

struct MenuSuggestionItemView: View {
    let coffeMenu: CoffeeMenu
    var body: some View {
        VStack {
            coffeMenu.image
                .resizable()
                .clipShape(Circle())
                .frame(width: 100.0, height: 100.0)
            Text(coffeMenu.name)
                .font(.caption)
        }
    }
}

struct MenuSuggestionSectionView_PreViews: PreviewProvider {
    static var previews: some View {
        MenuSuggestionSectionView()
    }
}
