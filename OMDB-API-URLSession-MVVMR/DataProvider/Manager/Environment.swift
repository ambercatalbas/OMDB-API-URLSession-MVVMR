//
//  Environment.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 29.10.2023.
//

import Foundation

public struct Environment {
    var baseURL: String {
        let apiKey = "bf9fd116"
        return "https://www.omdbapi.com/" + String(format: "?apikey=%@", apiKey)
    }
}
