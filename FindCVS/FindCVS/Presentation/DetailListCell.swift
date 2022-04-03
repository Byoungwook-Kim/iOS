//
//  DetailListCell.swift
//  FindCVS
//
//  Created by Byoung_wook on 2022/03/13.
//

import UIKit

class DetailListCell: UITableViewCell {
    let placeNameLabel = UILabel()
    let addressLabel = UILabel()
    let destanceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setData(_ data: DetailListCellData) {
        
    }
    
    private func attribute() {
        
    }
    
    private func layout() {
        
    }
}
