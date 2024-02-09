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
    var colorModel: HomePageColorModel!
    
    override func setUp() {
        super.setUp()
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        colorModel = HomePageColorModel(topBtnColor: UIColor.red, middleBtnColor: UIColor.red, bottomBtnColor: UIColor.red)
    }

    func test_topButtonColor() {
        let homeController = storyboard.instantiateInitialViewController() as! HomeViewController
        homeController.viewModel.model = colorModel
        let _ = homeController.view
        homeController.viewDidLoad()
        XCTAssertTrue(homeController.topButton.backgroundColor == colorModel.topButtonColor)
    }
    
    func test_MiddleButtonColor() {
        let homeController = storyboard.instantiateInitialViewController() as! HomeViewController
        homeController.viewModel.model = colorModel
        let _ = homeController.view
        homeController.viewDidLoad()
        XCTAssertTrue(homeController.middleButton.backgroundColor == colorModel.middleButtonColor)
    }
    
    func test_BottomButtonColor() {
        let homeController = storyboard.instantiateInitialViewController() as! HomeViewController
        homeController.viewModel.model = colorModel
        let _ = homeController.view
        homeController.viewDidLoad()
        XCTAssertTrue(homeController.bottomButton.backgroundColor == colorModel.bottomButtonColor)
    }
    
    func test_noActionIdentification() {
        let homeController = storyboard.instantiateInitialViewController() as! HomeViewController
        homeController.viewModel.model = colorModel
        let _ = homeController.view
        homeController.viewDidLoad()
        XCTAssertEqual(homeController.buttonLabel.text, "No Button Tapped")
    }
    
    func test_topButtonTapIdentification() {
        let homeController = storyboard.instantiateInitialViewController() as! HomeViewController
        homeController.viewModel.model = colorModel
        let _ = homeController.view
        homeController.viewDidLoad()
        homeController.topButtonTapped(homeController.topButton!)
        XCTAssertEqual(homeController.buttonLabel.text, "Top Button Tapped")
    }
    
    func test_middleButtonTapIdentification() {
        let homeController = storyboard.instantiateInitialViewController() as! HomeViewController
        homeController.viewModel.model = colorModel
        let _ = homeController.view
        homeController.viewDidLoad()
        homeController.middleButtonTapped(homeController.middleButton!)
        XCTAssertEqual(homeController.buttonLabel.text, "Middle Button Tapped")
    }
    
    func test_bottomButtonTapIdentification() {
        let homeController = storyboard.instantiateInitialViewController() as! HomeViewController
        homeController.viewModel.model = colorModel
        let _ = homeController.view
        homeController.viewDidLoad()
        homeController.bottomButtonTapped(homeController.bottomButton!)
        XCTAssertEqual(homeController.buttonLabel.text, "Bottom Button Tapped")
    }


}

