//
//  TMDB+Movee.swift
//  Movee
//
//  Created by Cristian Kocza on 04/07/2020.
//

import TMDB

extension Movie: Identifiable { }

extension TMDB.API {
    
    enum Error: Swift.Error {
        case unknown
        case networkError(Swift.Error)
        case unparseableData(Swift.Error)
    }

    func send<T: Decodable>(request: TMDB.API.Request<T>, completion: @escaping (Result<T, Swift.Error>) -> Void) {
        URLSession.shared.dataTask(with: request.url) { data,  response, error in
            if let error = error {
                completion(.failure(Error.networkError(error)))
            } else {
                completion(Result { try type(of: request).jsonDecoder().decode(T.self, from: data ?? Data()) })
            }
        }.resume()
    }
}
