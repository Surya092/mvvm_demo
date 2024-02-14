//
//  AppCoordinator.swift
//  mvvmdemo
//
//  Created by Suryanarayan Sahu on 14/02/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator]
    var navigationController: UINavigationController
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    init(navController: UINavigationController) {
        self.navigationController = navController
        self.children = []
        start()
    }
    
    func start() {
        goToHomePage()
    }
    
    func goToHomePage(){
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeViewController.viewModel = HomeViewModel(coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func goToLandingPage(dataLabel: String, pageTitle: String) {
        let landingPageController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LandingPageViewController") as! LandingPageViewController
        landingPageController.viewModel = LandingPageViewModel(label: dataLabel, title: pageTitle)
        navigationController.pushViewController(landingPageController, animated: true)
    }
}
