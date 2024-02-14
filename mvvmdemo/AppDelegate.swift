//
//  AppDelegate.swift
//  mvvmdemo
//
//  Created by Suryanarayan Sahu on 09/02/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator : AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController.init()
        appCoordinator = AppCoordinator(navController: navigationController)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }

}

