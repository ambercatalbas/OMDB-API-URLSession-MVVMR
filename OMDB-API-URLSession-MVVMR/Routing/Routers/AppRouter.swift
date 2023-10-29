//
//  AppRouter.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import UIKit

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = HomeRoute
    
    static let shared = AppRouter()
    
    func startApp() {
        placeOnWindowHome()
    }
    
    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil

    }
    
}
