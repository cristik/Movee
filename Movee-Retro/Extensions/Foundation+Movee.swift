//
//  Foundation+Movee.swift
//  Movee
//
//  Created by Cristian Kocza on 05/07/2020.
//

import Foundation
import Combine

extension URLSession: NetworkClient {
    func send<T: NetworkRequest>(_ request: T) -> Future<T.ResponseType, Error> {
        return Future { promise in
            self.dataTask(with: request.toURLRequest()) { data, response, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    do {
                        try promise(.success(request.decode(from: data ?? Data())))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }.resume()
        }
    }
}
