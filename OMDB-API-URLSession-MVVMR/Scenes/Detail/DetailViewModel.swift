//
//  DetailViewModel.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import Foundation

protocol DetailViewDataSource {
    var movie: Movie? {get set}
}

protocol DetailViewEventSource {}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource {}

final class DetailViewModel: BaseViewModel<DetailRouter>, DetailViewProtocol {
    var movie: Movie?
    
    init(router: DetailRouter, movie: Movie) {
        super.init(router: router)
        self.movie = movie
    }
    
    private func dismisScene() {
        router.close()
    }
}

public struct Movie {
    var image: String?
    var title: String?
    var description: String?
    
   public init(image: String? = nil, title: String? = nil, description: String? = nil) {
        self.image = image
        self.title = title
        self.description = description
    }
}
