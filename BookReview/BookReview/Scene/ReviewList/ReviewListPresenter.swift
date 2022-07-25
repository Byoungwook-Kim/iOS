//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by Byoung_wook on 2022/07/26.
//

import Foundation

protocol ReviewListProtocol {}

final class ReviewListPresenter {
    private let viewController: ReviewListProtocol
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
}

