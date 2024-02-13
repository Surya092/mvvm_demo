//
//  HomeViewModel.swift
//  mvvmdemo
//
//  Created by Suryanarayan Sahu on 09/02/24.
//

import Foundation

protocol HomeViewModelProtocol {
    func updateTableView()
}

class HomeViewModel {
    
    var model = HomePageModel(pageItems: ["Red", "Green", "Blue"], title: "Home Page")
    var delegate: HomeViewModelProtocol!
    
    func setDataOnLoad() {
        self.delegate.updateTableView()
    }
    
    func getNavigationTitle() -> String {
        model.pageTitle
    }
    
    func getTableViewItemsCount() -> Int {
        model.items.count
    }
    
}

class HomeCellViewModel {
    
    var cellModel: HomeViewModel!
    var indexData: Int!
    
    init(model: HomeViewModel, index: Int) {
        self.cellModel = model
        self.indexData = index
    }
    
    func getCellData() -> String {
        cellModel.model.items[indexData]
    }
    
}

