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
    
    func getItemTitle(indexPath: IndexPath) -> String {
        model.items[indexPath.row]
    }
    
}

