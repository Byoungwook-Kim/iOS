//
//  AlertActionConvertible.swift
//  SearchDaumBlog
//
//  Created by Byoung_wook on 2022/02/01.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
