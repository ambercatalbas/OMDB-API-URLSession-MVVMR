//
//  SearchResponse.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 30.10.2023.
//

import Foundation

// MARK: - SearchResponse
public struct SearchResponse: Codable {
    public let search: [Search]?
    public let totalResults, response: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
    
    public init(search: [Search]?, totalResults: String?, response: String?) {
        self.search = search
        self.totalResults = totalResults
        self.response = response
    }
}

// MARK: - Search
public struct Search: Codable {
    public let title, year, imdbID: String?
    public let type: String?
    public let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
    
    public init(title: String?, year: String?, imdbID: String?, type: String?, poster: String?) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
        self.poster = poster
    }
}


extension SearchResponse {
    
    var searchTableViewList: [HomeTableViewCellProtocol] {
        var list = [HomeTableViewCellProtocol]()
        guard let search = search else {return list}
        let  movies = search.map({Movie(image: $0.poster, title: String(format: "Movie Name: %@", $0.title ?? ""), description: String(format: "IMDB: %@", $0.imdbID ?? ""))})
        list = movies.map({HomeTableViewCellModel(movie: $0)})
        return list
    }
    
    var searchCollectionViewList: [HomeCollectionViewCellProtocol] {
        var list = [HomeCollectionViewCellProtocol]()
        guard let search = search else {return list}
        let  movies = search.map({Movie(image: $0.poster, title: $0.title, description: $0.imdbID)})
        list = movies.map({HomeCollectionViewCellModel(movie: $0)})
        return list
    }
    
}
