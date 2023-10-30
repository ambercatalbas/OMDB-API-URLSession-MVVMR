//
//  String+Extensions.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 29.10.2023.
//

import Foundation

extension LosslessStringConvertible {
    var string: String { .init(self) }
}

extension String {
    
    var toInt: Int? {
        return Int(self)
    }
}
