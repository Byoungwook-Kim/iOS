//
//  NavigationBarWithButton.swift
//  MyAssets
//
//  Created by Byoung_wook on 2021/12/14.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier {
    var title: String = ""
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .padding(),
                trailing: Button(
                    action: {print("버튼을 눌렀습니다")},
                    label: {
                        Image(systemName: "plus")
                        Text("자산추가")
                        .font(.system(size: 13))
                }
                )
                    .accentColor(.black)
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black)
                    )
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let apperance = UINavigationBarAppearance()
                apperance.configureWithTransparentBackground()
                apperance.backgroundColor = UIColor(white: 1, alpha: 0.5)
                UINavigationBar.appearance()
                    .standardAppearance = apperance
                UINavigationBar.appearance()
                    .compactAppearance = apperance
                UINavigationBar.appearance()
                    .scrollEdgeAppearance = apperance
            }
    }
}

extension View {
    func navigationBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarWithButton(title: title))
    }
}

struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigationBarWithButtonStyle("내 자산")
                
        }
    }
}
