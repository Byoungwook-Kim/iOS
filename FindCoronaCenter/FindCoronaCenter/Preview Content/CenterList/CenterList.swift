//
//  CenterList.swift
//  FindCoronaCenter
//
//  Created by Byoung_wook on 2022/04/03.
//

import SwiftUI

struct CenterList: View {
    var centers = [Center]()
    var body: some View {
        List(centers, id: \.id) {
            center in
            NavigationLink(destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let centers = [
            Center(id: 0, sido: .경기도, facilityName: "우리집", address: "주소영역", lat: "35.321321", lng: "35.321321", centerType: .center , phoneNumber: "0103321311")
        
        ]
        CenterList(centers: centers)
    }
}
