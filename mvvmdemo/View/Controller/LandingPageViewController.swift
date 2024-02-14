//
//  LandingPageViewController.swift
//  mvpdemo
//
//  Created by Suryanarayan Sahu on 13/02/24.
//

import UIKit

class LandingPageViewController: UIViewController {
    
    @IBOutlet weak var pageLabel: UILabel!
    
    var dataLabel: String = ""
    var pageTitle: String = ""
    var viewModel: LandingPageViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        navigationController?.navigationBar.topItem?.title = viewModel.getNavigationTitle()
        self.pageLabel.text = viewModel.getPageLabel()
    }

}

//MARK: Presenter Callbacks
extension LandingPageViewController: LandingPageViewModelProtocol {
    
}
