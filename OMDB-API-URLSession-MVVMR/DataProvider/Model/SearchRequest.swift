//
//  SearchRequest.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 30.10.2023.
//

import Foundation

struct SearchRequest: Codable {
    var s: String
    var page: Int
}
