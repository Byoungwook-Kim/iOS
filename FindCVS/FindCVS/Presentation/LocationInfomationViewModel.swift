//
//  LocationInfomationViewModel.swift
//  FindCVS
//
//  Created by Byoung_wook on 2022/02/20.
//

import Foundation
import RxCocoa
import RxSwift

struct LocationInfomationViewModel {
    let disposeBag = DisposeBag()
    
    let setMapCenter: Signal<MTMapPoint>
    let errorMessage: Signal<String>
    
    let currentLocation = PublishRelay<MTMapPoint>()
    let mapCenterPoint  = PublishRelay<MTMapPoint>()
    let selectPOIItem  = PublishRelay<MTMapPOIItem>()
    let mapViewError = PublishRelay<String>()
    let currentLocationButtonTapped = PublishRelay<Void>()
    
    init() {
        let moveToCurrentLocation = currentLocationButtonTapped
            .withLatestFrom(currentLocation)
        let currentMapCenter = Observable
            .merge(
                currentLocation.take(1),
                moveToCurrentLocation
            )
        
        setMapCenter = currentMapCenter
            .asSignal(onErrorSignalWith: .empty())
        
        errorMessage = mapViewError.asObservable()
            .asSignal(onErrorJustReturn: "잠시 후 다시 시도해주세요.")
    }
}
