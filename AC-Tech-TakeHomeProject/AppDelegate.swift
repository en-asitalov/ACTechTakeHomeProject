//
//  AppDelegate.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        resetKeyChainDataIfNeeded()
        setupInitialViewController()
        setupAppearance()
        return true
    }
    
    // MARK: - Private methods
    private func setupInitialViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = SplashScreenBuilder().buildSplashScreenViewController()
    }
    
    private func setupAppearance() {
        
        // Navigation Bar
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = Colors.defaultThemeColor
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        
        // Tab Bar
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white
            ], for: .normal)
    }
    
    private func resetKeyChainDataIfNeeded() {
        let userDefaultsManager = ServicesContainer.default.resolve(UserDefaultsManager.self)!
        let keyChainService = ServicesContainer.default.resolve(KeychainService.self)!
        
        if !userDefaultsManager.getBool(for: "hasRunBeforeKey") {
            keyChainService.removeLoginData()
            userDefaultsManager.setBool(value: true, for: "hasRunBeforeKey")
        }
    }
}

