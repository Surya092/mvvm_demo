//
//  HomeViewController.swift
//  mvcdemo
//
//  Created by Suryanarayan Sahu on 07/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var buttonLabel: UILabel!
    
    var viewModel = HomeViewModel()
    
    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.updatePageonLoad()
    }
    
    // MARK: Button Actions
    
    @IBAction func topButtonTapped(_ sender: Any) {
        viewModel.updateButtonAction(type: .top)
    }
    
    @IBAction func middleButtonTapped(_ sender: Any) {
        viewModel.updateButtonAction(type: .middle)
    }
    
    @IBAction func bottomButtonTapped(_ sender: Any) {
        viewModel.updateButtonAction(type: .bottom)
    }
    
}

//MARK: HomeView Extension
extension HomeViewController: HomeViewModelProtocol {
    func updateHomeOnPageLoad(topBtnColor: UIColor, middleBtnColor: UIColor, bottomBtnColor: UIColor) {
        self.topButton.backgroundColor = topBtnColor
        self.middleButton.backgroundColor = middleBtnColor
        self.bottomButton.backgroundColor = bottomBtnColor
    }
    
    func updateLabelOnTap(labelText: String) {
        self.buttonLabel.text = labelText
    }
}


