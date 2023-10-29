//
//  HomeTableViewCellModel.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import Foundation

public protocol HomeTableViewCellDataSource: AnyObject {
    var movie: Movie {get}
}

public protocol HomeTableViewCellEventSource: AnyObject {
    
}

public protocol HomeTableViewCellProtocol: HomeTableViewCellDataSource, HomeTableViewCellEventSource {
    
}

public final class HomeTableViewCellModel: HomeTableViewCellProtocol {
    public var movie: Movie
    
    public init(movie: Movie) {
        self.movie = movie
    }
}
