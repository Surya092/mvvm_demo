//
//  LandingPageModel.swift
//  mvpdemo
//
//  Created by Suryanarayan Sahu on 13/02/24.
//

import Foundation

protocol LandingPageDataProtocol {
    var pageLabel: String {get}
    var pageTitle: String {get}
}

struct LandingPageModel: LandingPageDataProtocol {
    var pageLabel: String
    var pageTitle: String

    init(label: String, title: String) {
        self.pageLabel = label
        self.pageTitle = title
    }
}
