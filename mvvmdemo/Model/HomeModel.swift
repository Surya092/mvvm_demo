//
//  HomeModel.swift
//  mvcdemo
//
//  Created by Suryanarayan Sahu on 07/02/24.
//

import Foundation
import UIKit

protocol HomePageDataProtocol {
    var items: [String] {get}
    var pageTitle: String {get}
}

struct HomePageModel: HomePageDataProtocol {
    var items: [String]
    var pageTitle: String

    init(pageItems: [String], title: String) {
        self.items = pageItems
        self.pageTitle = title
    }
}
