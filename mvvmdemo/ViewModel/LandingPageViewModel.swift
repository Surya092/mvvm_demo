//
//  LandingPageViewModel.swift
//  mvpdemo
//
//  Created by Suryanarayan Sahu on 13/02/24.
//

import Foundation

protocol LandingPageViewModelProtocol {
    
}

class LandingPageViewModel {
    
    var model: LandingPageModel!
    var delegate: LandingPageViewModelProtocol!
    
    init(label: String, title: String) {
        self.model = LandingPageModel(label: label, title: title)
    }
    
    func getNavigationTitle() -> String {
        model.pageTitle
    }
    
    func getPageLabel() -> String {
        model.pageLabel
    }
}
