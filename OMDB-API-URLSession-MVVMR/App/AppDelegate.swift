//
//  AppDelegate.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window:UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        AppRouter.shared.startApp()
        self.window?.makeKeyAndVisible()
        return true
    }
}

