//
//  HomeTableViewCell.swift
//  mvvmdemo
//
//  Created by Suryanarayan Sahu on 13/02/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cellDataLabel: UILabel!
    
    var viewModel: HomeCellViewModel!
    
    func setData() {
        cellDataLabel.text = viewModel.getCellData()
    }
    
}
