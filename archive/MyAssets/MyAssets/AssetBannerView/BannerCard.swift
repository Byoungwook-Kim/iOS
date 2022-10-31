//
//  BannerCard.swift
//  MyAssets
//
//  Created by Byoung_wook on 2021/12/21.
//

import SwiftUI

struct BannerCard: View {
    var banner: AsstBanner
    
    var body: some View {
        
        Color(banner.backgroundColor)
            .overlay(
                VStack {
                    Text(banner.title)
                        .font(.title)
                    Text(banner.description)
                        .font(.subheadline)
                }
            )
    }
}

struct BannerCard_Previews: PreviewProvider {
    static var previews: some View {
        let banner0 = AsstBanner(title: "공지사항", description: "추가 공지 확인해주세요", backgroundColor: .red)
        BannerCard(banner: banner0)
    }
}
