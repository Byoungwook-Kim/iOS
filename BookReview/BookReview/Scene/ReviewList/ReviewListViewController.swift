//
//  ViewController.swift
//  BookReview
//
//  Created by Byoung_wook on 2022/07/25.
//

import UIKit

final class ReviewListViewController: UIViewController {
    
    private lazy var presenter = ReviewListPresenter(viewController: self)

}

extension ReviewListViewController: ReviewListProtocol {}

