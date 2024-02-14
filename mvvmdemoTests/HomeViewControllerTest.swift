//
//  HomeViewControllerTest.swift
//  mvvmdemoTests
//
//  Created by Suryanarayan Sahu on 08/02/24.
//

import XCTest
@testable import mvvmdemo

final class HomeViewControllerTest: XCTestCase {
    
    var storyboard: UIStoryboard!
    var homePageModel: HomePageModel!
    var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        homePageModel = HomePageModel(pageItems: ["Red", "Green", "Blue"], title: "Home Page")
        sut = (storyboard.instantiateInitialViewController() as! UINavigationController).viewControllers.first as? HomeViewController
        
    }
    
    func test_navigationTitleSetup() {
        let coordinator = AppCoordinator(navController: UINavigationController.init())
        let viewModel = HomeViewModel(coordinator: coordinator)
        viewModel.model = homePageModel
        sut.viewModel = viewModel
        let _ = sut.view
        RunLoop.current.run(until: Date())
        XCTAssertEqual(sut.navigationController?.navigationBar.topItem?.title, homePageModel.pageTitle)
    }

    func test_topCellSetup() {
        let coordinator = AppCoordinator(navController: UINavigationController.init())
        let viewModel = HomeViewModel(coordinator: coordinator)
        viewModel.model = homePageModel
        sut.viewModel = viewModel
        let _ = sut.view
        RunLoop.current.run(until: Date())
        let cell = sut.tableView(sut.homeTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! HomeTableViewCell
        XCTAssertEqual(cell.cellDataLabel.text, homePageModel.items[0])
    }
    
    func test_MiddleCellSetup() {
        let coordinator = AppCoordinator(navController: UINavigationController.init())
        let viewModel = HomeViewModel(coordinator: coordinator)
        viewModel.model = homePageModel
        sut.viewModel = viewModel
        let _ = sut.view
        RunLoop.current.run(until: Date())
        let cell = sut.tableView(sut.homeTableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! HomeTableViewCell
        XCTAssertEqual(cell.cellDataLabel.text, homePageModel.items[1])
    }
    
    func test_BottomCellSetup() {
        let coordinator = AppCoordinator(navController: UINavigationController.init())
        let viewModel = HomeViewModel(coordinator: coordinator)
        viewModel.model = homePageModel
        sut.viewModel = viewModel
        let _ = sut.view
        RunLoop.current.run(until: Date())
        let cell = sut.tableView(sut.homeTableView, cellForRowAt: IndexPath(row: 2, section: 0)) as! HomeTableViewCell
        XCTAssertEqual(cell.cellDataLabel.text, homePageModel.items[2])
    }

}


