//
//  HomeCollectionViewCellModel.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import Foundation

public protocol HomeCollectionViewCellDataSource: AnyObject {
    var movie: Movie {get}
}

public protocol HomeCollectionViewCellEventSource: AnyObject {
    
}

public protocol HomeCollectionViewCellProtocol: HomeCollectionViewCellDataSource, HomeCollectionViewCellEventSource {
    
}

public final class HomeCollectionViewCellModel: HomeCollectionViewCellProtocol {
    public var movie: Movie
    
    public init(movie: Movie) {
        self.movie = movie
    }
}
