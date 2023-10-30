//
//  Codable+Extensions.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 29.10.2023.
//

import Foundation

import UIKit

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    var queryItems: [URLQueryItem]? {
        if let items = dictionary {
            var qItems = [URLQueryItem]()
            for item in items {
                if let value = item.value as? String {
                    qItems.append(URLQueryItem(name: item.key, value: value))
                }else if let value = item.value as? Int {
                    qItems.append(URLQueryItem(name: item.key, value: value.string))
                }
            }
            return qItems
        }else {
            return nil
        }
    }
    
    var stringDictionary: [String: String]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: String] }
    }
}
