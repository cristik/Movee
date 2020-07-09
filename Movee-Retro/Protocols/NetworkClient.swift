//
//  NetworkClient.swift
//  Movee
//
//  Created by Cristian Kocza on 05/07/2020.
//

import Foundation
import Combine

protocol NetworkRequest {
    associatedtype ResponseType
    
    func toURLRequest() -> URLRequest
    func decode(from data: Data) throws -> ResponseType
}

protocol NetworkClient {
    func send<T: NetworkRequest>(_ request: T) -> Future<T.ResponseType, Error>
}
