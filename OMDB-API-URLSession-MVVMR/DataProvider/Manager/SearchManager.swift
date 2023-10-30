//
//  SearchManager.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 29.10.2023.
//

import UIKit

class SearchManager {
    static let shared = SearchManager()
    
    func search(request: SearchRequest, onSuccess: SearchCallback, onFailure: ErrorCallback) {
        let e = OMDBAPI.search(items: request.queryItems ?? [])
        BaseManager.shared.request(to: e) { (r: Result<SearchResponse?, Error>) in
            switch r {
            case .success(let r):
                guard let response = r else {return}
                onSuccess?(response)
                print(response)
            case .failure(let e):
                onFailure?(e)
            }
        }
    }
}

