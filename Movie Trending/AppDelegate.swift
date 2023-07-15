//
//  AppDelegate.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 15/07/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        showMainView()
        return true
    }
    
    func showMainView() {
        // Set main view controller
        let MainVC = MainViewController()
        let navigationController = UINavigationController(rootViewController: MainVC)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
}

