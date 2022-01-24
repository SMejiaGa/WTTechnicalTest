//
//  AppDelegate.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        prepareUIWindow()
        GMSServices.provideAPIKey("AIzaSyA_DaIs4tvv0-uGxXB_jYXLTwkSYcGwSGo")
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

