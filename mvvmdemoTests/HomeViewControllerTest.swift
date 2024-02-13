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
    var model: HomePageModel!
    var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        model = HomePageModel(pageItems: ["Red", "Green", "Blue"], title: "Home Page")
        sut = (storyboard.instantiateInitialViewController() as! UINavigationController).viewControllers.first as? HomeViewController
        
    }
    
    func test_navigationTitleSetup() {
        sut.viewModel.model = model
        let _ = sut.view
        RunLoop.current.run(until: Date())
        XCTAssertEqual(sut.navigationController?.navigationBar.topItem?.title, model.pageTitle)
    }

    func test_topCellSetup() {
        sut.viewModel.model = model
        let _ = sut.view
        RunLoop.current.run(until: Date())
        XCTAssertEqual(sut.tableView(sut.homeTableView, cellForRowAt: IndexPath(row: 0, section: 0)).textLabel?.text, model.items[0])
    }
    
    func test_MiddleCellSetup() {
        sut.viewModel.model = model
        let _ = sut.view
        RunLoop.current.run(until: Date())
        XCTAssertEqual(sut.tableView(sut.homeTableView, cellForRowAt: IndexPath(row: 1, section: 0)).textLabel?.text, model.items[1])
    }
    
    func test_BottomCellSetup() {
        sut.viewModel.model = model
        let _ = sut.view
        RunLoop.current.run(until: Date())
        XCTAssertEqual(sut.tableView(sut.homeTableView, cellForRowAt: IndexPath(row: 2, section: 0)).textLabel?.text, model.items[2])
    }

}


