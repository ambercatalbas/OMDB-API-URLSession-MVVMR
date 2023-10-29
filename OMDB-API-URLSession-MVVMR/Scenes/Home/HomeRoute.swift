//
//  HomeRoute.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

protocol HomeRoute {
    func placeOnWindowHome()
}

extension HomeRoute where Self: RouterProtocol {
    
    func placeOnWindowHome() {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
