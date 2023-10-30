//
//  Movie.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 30.10.2023.
//

import Foundation

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
