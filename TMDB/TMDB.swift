//
//  API.swift
//  CatsUI
//
//  Created by Cristian Kocza on 24/06/2020.
//  Copyright © 2020 cristik. All rights reserved.
//

import UIKit

public struct Configuration: Codable {
    public let images: Images
    public let changeSizes: [String]
    
    public struct Images: Codable {
        public let baseUrl: String
        public let secureBaseUrl: String
        public let backdropSizes: [String]
        public let logoSizes: [String]
        public let posterSizes: [String]
        public let profileSizes: [String]
        public let stillSizes: [String]
    }
}

public struct Movie: Codable {
    public let id: Int
    public let title: String
    public let backdropPath: String?
    public let posterPath: String?
    public let voteAverage: Double
    public let voteCount: Int
    public let adult: Bool
    public let popularity: Double
    public let video: Bool
}

public struct MoviesCollectionResponse: Codable {
    public let results: [Movie]
}

public class API {
    
    private let apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    /// Builds the request for retrieving the configuration
    func getConfiguration() -> Request<Configuration> {
        return Request(url: URL(string: "https://api.themoviedb.org/3/configuration?api_key=\(apiKey)")!)
    }
    
    /// Builds the request for retrieving the list of popular movies
    public func getPopularMovies() -> Request<MoviesCollectionResponse> {
        return Request(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)")!)
    }
    
    /// Builds the request for retrieving the list of popular movies
    public func getTopRatedMovies() -> Request<MoviesCollectionResponse> {
        return Request(url: URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)")!)
    }
    
    /// Builds the request for retrieving the list of popular movies
    public func getNowPlayingMovies() -> Request<MoviesCollectionResponse> {
        return Request(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!)
    }
    
    /// Builds the request for retrieving the list of popular movies
    public func getUpcomingMovies() -> Request<MoviesCollectionResponse> {
        return Request(url: URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!)
    }
    
    /// Builds the request for the given image details
    /// - Parameters:
    ///   - path: the image path
    ///   - size: the image size
    public func imageUrl(for path: String, size: String) -> Request<UIImage> {
        return Request(url: URL(string: "https://image.tmdb.org/t/p/")!.appendingPathComponent(size).appendingPathComponent(path))
    }
    
    public struct Request<T> {
        public let url: URL
        
        public static func jsonDecoder() -> JSONDecoder {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }
    }
}
