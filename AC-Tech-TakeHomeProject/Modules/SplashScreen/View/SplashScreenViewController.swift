//
//  SplashScreenViewController.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit

protocol SplashScreenViewControllerInput: class {
    
}

class SplashScreenViewController: UIViewController, SplashScreenViewControllerInput {
    
    var presenter: SplashScreenPresenterLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.checkUserCredentials()
    }
}
