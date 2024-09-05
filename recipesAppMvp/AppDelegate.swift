//
//  AppDelegate.swift
//  recipesAppMvp
//
//  Created by Alena on 31.07.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = ViewFactory.shared.createTabBarScreen(title: "")
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
        
    }
    
}

