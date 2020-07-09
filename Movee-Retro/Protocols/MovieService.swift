//
//  MovieService.swift
//  Movee-Retro
//
//  Created by Cristian Kocza on 08/07/2020.
//

import Foundation
import Combine

struct Movie: Identifiable {
    let id: Int
    let title: String
    let imageUrl: URL?
    let rating: Double
}

protocol MovieService {
    func getPopularMovies(with networkClient: NetworkClient) -> AnyPublisher<[Movie], Error>
    func getUpcomingMovies(with networkClient: NetworkClient) -> AnyPublisher<[Movie], Error>
    func getTopRatedMovies(with networkClient: NetworkClient) -> AnyPublisher<[Movie], Error>
    func getNowPlayingMovies(with networkClient: NetworkClient) -> AnyPublisher<[Movie], Error>
}
