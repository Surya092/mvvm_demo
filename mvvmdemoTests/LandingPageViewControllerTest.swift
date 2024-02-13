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
    var model: HomePageModel!
    var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        model = HomePageModel(pageItems: ["Red", "Green", "Blue"], title: "Home Page")
        sut = (storyboard.instantiateInitialViewController() as! UINavigationController).viewControllers.first as? HomeViewController
    }
    
    func test_LandingPageNavigation() {
        sut.viewModel.model = model
        let _ = sut.view
        sut.tableView(sut.homeTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        RunLoop.current.run(until: Date())
        guard let _ = sut.navigationController?.topViewController as? LandingPageViewController else {
            XCTFail()
            return
        }
    }
    
    func test_LabelSetup_MatchIndex() {
        sut.viewModel.model = model
        let _ = sut.view
        sut.tableView(sut.homeTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        RunLoop.current.run(until: Date())
        let landingPageController = sut.navigationController?.viewControllers[1] as! LandingPageViewController
        let _ = landingPageController.view
        RunLoop.current.run(until: Date())
        XCTAssertEqual(landingPageController.pageLabel.text, model.items[0])
    }
    
    func test_LabelSetup_MismatchIndex() {
        sut.viewModel.model = model
        let _ = sut.view
        sut.tableView(sut.homeTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        RunLoop.current.run(until: Date())
        let landingPageController = sut.navigationController?.viewControllers[1] as! LandingPageViewController
        let _ = landingPageController.view
        RunLoop.current.run(until: Date())
        XCTAssertNotEqual(landingPageController.pageLabel.text, model.items[1])
    }
    
}
