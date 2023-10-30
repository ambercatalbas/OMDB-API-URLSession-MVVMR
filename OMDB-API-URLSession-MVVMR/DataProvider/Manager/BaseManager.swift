//
//  BaseManager.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 29.10.2023.
//

import UIKit

struct NetworkError: Error {
    var message: String?
    var log: String?
    var endpoint: Endpoint?
}

enum Result<T, E> where E: Error {
    case success(T)
    case failure(E)
}

class BaseManager {
    private init() {}
    
    static let shared = BaseManager()
    
    private var session: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 120
        configuration.timeoutIntervalForResource = 120
        
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func request<T: Decodable>(to endpoint: Endpoint, isLoadingEnabled: Bool = true, needToken: Bool = false, completion: @escaping (Result<T, Error>) -> ()) {
        guard let urlRequest = endpoint.generateURLRequest() else {
            Logger.error("URL Request Error")
            return}
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                LoadingUtils.shared.visible(false)
                completion(.failure(NetworkError(message: "Bir hata oluştu", log: error?.localizedDescription, endpoint: endpoint)))
                return
            }
            guard response != nil else {
                LoadingUtils.shared.visible(false)
                completion(.failure(NetworkError(message: "Bir hata oluştu", log: "Response null", endpoint: endpoint)))
                return
            }
            guard let data = data else {
                LoadingUtils.shared.visible(false)
                completion(.failure(NetworkError(message: "Bir hata oluştu", log: "Data null", endpoint: endpoint)))
                return
            }
            
            Logger.info("RESPONSE:" + String(decoding: data, as: UTF8.self))
            
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                if isLoadingEnabled {
                    LoadingUtils.shared.visible(false)
                }
                completion(.success(responseObject))
                
            } catch let e {
                Logger.warning("Data error : \(e)")
                Logger.warning("Data parsing error : \(e.localizedDescription)")
                Logger.warning("Data name \(T.self)")
                LoadingUtils.shared.visible(false)
                completion(.failure(NetworkError(message: "Bir hata oluştu", log: "JSON Decoder Error: \(e)", endpoint: endpoint)))
            }
        }
        dataTask.resume()
    }
}




