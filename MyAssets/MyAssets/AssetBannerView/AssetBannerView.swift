//
//  AssetBannerView.swift
//  MyAssets
//
//  Created by Byoung_wook on 2021/12/21.
//

import SwiftUI

struct AssetBannerView: View {
    let bannerList: [AsstBanner] = [
        AsstBanner(title: "공지사항", description: "추가된 공지사항", backgroundColor: .red),
        AsstBanner(title: "이벤트", description: "추가된 이벤트", backgroundColor: .yellow),
        AsstBanner(title: "광고", description: "추가된 광고", backgroundColor: .blue),
        AsstBanner(title: "프로모션", description: "추가된 프로모션", backgroundColor: .yellow)
    ]
    
    @State private var currentPage = 0
    var body: some View {
        let bannerCards = bannerList.map {
            BannerCard(banner: $0) }
        
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: bannerCards, currentPage: $currentPage)
            PageControl(numberOfPages: bannerList.count, currentPage: $currentPage).frame(width: CGFloat(bannerCards.count * 18))
                .padding(.trailing)
        }
     
    }
}

struct AssetBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetBannerView()
            .aspectRatio(5/2, contentMode: .fit)
    }
}
