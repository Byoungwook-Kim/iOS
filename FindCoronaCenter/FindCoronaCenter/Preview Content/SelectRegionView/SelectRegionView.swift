//
//  SelectRegionView.swift
//  FindCoronaCenter
//
//  Created by Byoung_wook on 2022/04/03.
//

import SwiftUI
@main
struct SelectRegionView: App {
    @ObservedObject var viewModel = SelectRegionViewModel()
    
    private var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 80)), count: 2)
    }
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: items, spacing: 20) {
                    ForEach(Center.Sido.allCases, id: \.id) {
                        sido in
                        let centers = viewModel.centers[sido] ?? []
                        
                        NavigationLink(destination: CenterList(centers: centers)) {
                            SelectRegionItem(region: sido, count: centers.count)
                        }
                    }
                }
            }
                .padding()
                .navigationTitle("코로나 19 예방접종 센터")
            }
        }
    }


struct SelectRegionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SelectRegionViewModel()
        SelectRegionView(viewModel: viewModel)
    }
}
