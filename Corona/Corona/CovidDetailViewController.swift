//
//  CovidDetailViewController.swift
//  Corona
//
//  Created by Byoung_wook on 2021/12/01.
//

import UIKit

class CovidDetailViewController: UITableViewController {
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasInfowCell: UITableViewCell!
    @IBOutlet weak var reginalOutbreakCell: UITableViewCell!
    
    
    var covidOverview: CovidOverView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    
    }
    
    func configureView() {
        guard let covidOverview = self.covidOverview else { return }
        self.title = covidOverview.countryName
        self.newCaseCell.detailTextLabel?.text = "\(covidOverview.newCase)명"
        self.totalCaseCell.detailTextLabel?.text = "\(covidOverview.totalCase)명"
        self.recoveredCell.detailTextLabel?.text = "\(covidOverview.recovered)명"
        self.deathCell.detailTextLabel?.text = "\(covidOverview.death)명"
        self.percentageCell.detailTextLabel?.text = "\(covidOverview.percentage)명"
        self.overseasInfowCell.detailTextLabel?.text = "\(covidOverview.newFcase)명"
        self.reginalOutbreakCell.detailTextLabel?.text = "\(covidOverview.newCcase)명"

    }


}
