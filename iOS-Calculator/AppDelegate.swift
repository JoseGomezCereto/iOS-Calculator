//
//  AppDelegate.swift
//  iOS-Calculator
//
//  Created by Jose Maria Gomez Cereto on 3/12/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Setup
        setupView()

        return true
    }

    // MARK: - Private methods
    
    private func setupView() {

        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

}


