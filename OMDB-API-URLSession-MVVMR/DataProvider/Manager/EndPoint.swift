//
//  EndPoint.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 29.10.2023.
//
import UIKit

protocol Endpoint {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var method: String { get }
    func generateURLRequest() -> URLRequest?
}

enum OMDBAPI  {
    case search(items: [URLQueryItem])
}

extension OMDBAPI: Endpoint {
    
    var scheme: String {
        return "https"
    }
    var baseURL: String {
        return "www.omdbapi.com"
        
    }
    
    var path: String {
        switch self {
        case .search(_):
            return "/"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(items: let search):
            var items = [URLQueryItem(name: "apikey", value: Constants.apikey)]
            items.append(contentsOf: search)
            return items
        }
    }
    
    var method: String {
        return "get"
    }
    
    func generateURLRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
}
