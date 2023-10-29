//
//  DetailRoute.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

protocol DetailRoute {
    func pushDetail(movie: Movie)
}

extension DetailRoute where Self: RouterProtocol {
    
    func pushDetail(movie: Movie) {
        let router = DetailRouter()
        let viewModel = DetailViewModel(router: router, movie: movie)
        let viewController = DetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
