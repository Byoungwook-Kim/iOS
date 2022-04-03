//
//  CenterRow.swift
//  FindCoronaCenter
//
//  Created by Byoung_wook on 2022/04/03.
//

import SwiftUI

struct CenterRow: View {
    var center: Center
    var body: some View {
        VStack(alignment: .leading){ 
            HStack {
            Text(center.facilityName)
                .font(.headline)
            Text(center.centerType.rawValue)
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
            }
            Text(center.address)
                .font(.footnote)
            
            if let url = URL(string: "tel:" + center.phoneNumber)
            { Link(center.phoneNumber, destination: url)
                
            }
        }
        .padding()
    }
}

struct CenterRow_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .경기도, facilityName: "우리집", address: "주소영역", lat: "35.321321", lng: "35.321321", centerType: .center , phoneNumber: "0103321311")
    }
}
