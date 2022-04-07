//
//  EventSectionView.swift
//  Cafe
//
//  Created by Byoung_wook on 2022/04/07.
//

import SwiftUI

struct EventSectionView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 16.0) {
                ForEach(Event.sample) { event in
                    EventSectionItemView(event: event)
                }
            }.padding(.horizontal, 16.0)
        }
    }
}

struct EventSectionItemView: View {
    let event: Event
    var body: some View {
        VStack {
            event.image
                .resizable()
                .scaledToFit()
                .frame(height: 150.0)
                .clipped()
            Text(event.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            Text(event.description)
                .lineLimit(1)
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }.frame(width: UIScreen.main.bounds.width - 32.0)
    }
}

struct EventSectionView_Previews: PreviewProvider {
    static var previews: some View {
        EventSectionView()
    }
}
