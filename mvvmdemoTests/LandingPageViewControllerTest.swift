//
//  LandingPageViewControllerTest.swift
//  mvvmdemoTests
//
//  Created by Suryanarayan Sahu on 13/02/24.
//

import XCTest
@testable import mvvmdemo

final class LandingPageViewControllerTest: XCTestCase {

    var storyboard: UIStoryboard!
    var homePageModel: HomePageModel!
    var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        homePageModel = HomePageModel(pageItems: ["Red", "Green", "Blue"], title: "Home Page")
    }
    
    func test_LandingPageNavigation() {
        let coordinator = AppCoordinator(navController: UINavigationController.init())
        let viewModel = HomeViewModel(coordinator: coordinator)
        viewModel.model = homePageModel
        sut.viewModel = viewModel
        let _ = sut.view
        sut.tableView(sut.homeTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        RunLoop.current.run(until: Date())
        guard let _ = coordinator.navigationController.topViewController as? LandingPageViewController else {
            XCTFail()
            return
        }
    }
    
    func test_LabelSetup_MatchIndex() {
        let coordinator = AppCoordinator(navController: UINavigationController.init())
        let viewModel = HomeViewModel(coordinator: coordinator)
        viewModel.model = homePageModel
        sut.viewModel = viewModel
        let _ = sut.view
        sut.tableView(sut.homeTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        RunLoop.current.run(until: Date())
        let landingPageController = coordinator.navigationController.viewControllers[1] as! LandingPageViewController
        let _ = landingPageController.view
        RunLoop.current.run(until: Date())
        XCTAssertEqual(landingPageController.pageLabel.text, homePageModel.items[0])
    }
    
    func test_LabelSetup_MismatchIndex() {
        let coordinator = AppCoordinator(navController: UINavigationController.init())
        let viewModel = HomeViewModel(coordinator: coordinator)
        viewModel.model = homePageModel
        sut.viewModel = viewModel
        let _ = sut.view
        sut.tableView(sut.homeTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        RunLoop.current.run(until: Date())
        let landingPageController = coordinator.navigationController.viewControllers[1] as! LandingPageViewController
        let _ = landingPageController.view
        RunLoop.current.run(until: Date())
        XCTAssertNotEqual(landingPageController.pageLabel.text, homePageModel.items[1])
    }
    
}
