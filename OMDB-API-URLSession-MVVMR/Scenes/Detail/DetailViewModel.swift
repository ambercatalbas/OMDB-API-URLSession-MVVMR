//
//  DetailViewModel.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import Foundation

protocol DetailViewDataSource {
    var movie: Movie? {get set}
    func dismisScene()
}

protocol DetailViewEventSource {}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource {}

final class DetailViewModel: BaseViewModel<DetailRouter>, DetailViewProtocol {
    var movie: Movie?
    
    init(router: DetailRouter, movie: Movie) {
        super.init(router: router)
        self.movie = movie
    }
    
    func dismisScene() {
        router.close()
    }
}
