//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by Byoung_wook on 2022/07/26.
//

import Foundation
import UIKit

protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "\(indexPath)"
        
        return cell
    }
}

