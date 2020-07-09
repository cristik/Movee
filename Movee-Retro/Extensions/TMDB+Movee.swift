//
//  TMDB+Movee.swift
//  Movee
//
//  Created by Cristian Kocza on 04/07/2020.
//

import TMDB
import Combine

extension TMDB.Movie: Identifiable { }

extension Movee_Retro.Movie {
    init(_ tmdbMovie: TMDB.Movie, tmdbApi: TMDB.API) {
        self.init(id: tmdbMovie.id,
                  title: tmdbMovie.title,
                  imageUrl: tmdbMovie.backdropPath.map { tmdbApi.imageUrl(for: $0, size: "w300").url },
                  rating: tmdbMovie.voteAverage / 2)
    }
}

extension TMDB.API.Request: NetworkRequest where T: Decodable {
    func toURLRequest() -> URLRequest {
        return URLRequest(url: url)
    }
    
    func decode(from data: Data) throws -> T {
        return try Self.jsonDecoder().decode(T.self, from: data)
    }
}

extension TMDB.API: MovieService {
    func getPopularMovies(with networkClient: NetworkClient) -> AnyPublisher<[Movie], Error> {
        return networkClient.send(getPopularMovies())
            .map { $0.results.map { Movie.init($0, tmdbApi: self) } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getUpcomingMovies(with networkClient: NetworkClient) -> AnyPublisher<[Movie], Error> {
        return networkClient.send(getUpcomingMovies())
            .map { $0.results.map { Movie.init($0, tmdbApi: self) } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getTopRatedMovies(with networkClient: NetworkClient) -> AnyPublisher<[Movie], Error> {
        return networkClient.send(getTopRatedMovies())
            .map { $0.results.map { Movie.init($0, tmdbApi: self) } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getNowPlayingMovies(with networkClient: NetworkClient) -> AnyPublisher<[Movie], Error> {
        return networkClient.send(getNowPlayingMovies())
            .map { $0.results.map { Movie.init($0, tmdbApi: self) } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
