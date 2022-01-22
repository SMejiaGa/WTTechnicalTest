//
//  AppDelegate.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        prepareUIWindow()
        return true
    }
    
    private func prepareUIWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(
            rootViewController: LoginViewController(viewModel: LoginViewModel())
        )
        window?.makeKeyAndVisible()
    }


}

