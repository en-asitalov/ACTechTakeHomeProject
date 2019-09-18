//
//  AppTabBarBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

class AppTabBarBuilder {
    
    class AppTabBarController: UITabBarController {
        override func viewDidLoad() {
            super.viewDidLoad()
        }
    }
    
    func build() -> UITabBarController {
        
        let tabBarController = AppTabBarController()
        
        tabBarController.addChild(buildTransactionsViewController())
        tabBarController.addChild(buildPaymentsViewController())
        tabBarController.addChild(buildMoreMenuViewController())
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.tintColor = Colors.defaultThemeColor
        tabBarController.view.backgroundColor = .lightGray
        
        return tabBarController
    }
    
    // Create view controllers for app tab bar
    private func buildTransactionsViewController() -> UIViewController {
        
        let transactionsViewController = TransactionsBuilder().buildTransactionsViewController()
        let transactionsNavigationController = UINavigationController(rootViewController: transactionsViewController)
        transactionsViewController.title = "Transactions"
        
        transactionsNavigationController
            .tabBarItem = UITabBarItem(title: "Transactions",
                                       image: UIImage(named: "tab_bar_transactions")?.withRenderingMode(.alwaysOriginal),
                                       selectedImage: UIImage(named: "tab_bar_transactions"))
        
        return transactionsNavigationController
    }
    
    private func buildPaymentsViewController() -> UIViewController {
        
        let paymentsViewController = PaymentsBuilder().buildPaymentsViewController()
        let paymentsNavigationController = UINavigationController(rootViewController: paymentsViewController)
        paymentsViewController.title = "Payments"
        
        paymentsNavigationController
            .tabBarItem = UITabBarItem(title: "Payments",
                                       image: UIImage(named: "tab_bar_payments")?.withRenderingMode(.alwaysOriginal),
                                       selectedImage: UIImage(named: "tab_bar_payments"))
        
        return paymentsNavigationController
    }
    
    private func buildMoreMenuViewController() -> UIViewController {
        
        let moreMenuViewController = MoreMenuBuilder().buildMoreMenuViewController()
        let moreMenuNavigationController = UINavigationController(rootViewController: moreMenuViewController)
        moreMenuViewController.title = "More"
        
        moreMenuNavigationController
            .tabBarItem = UITabBarItem(title: "More",
                                       image: UIImage(named: "tab_bar_more")?.withRenderingMode(.alwaysOriginal),
                                       selectedImage: UIImage(named: "tab_bar_more"))
        
        return moreMenuNavigationController
    }
}
