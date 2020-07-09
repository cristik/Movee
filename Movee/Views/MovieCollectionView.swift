//
//  ContentView.swift
//  CatsUI
//
//  Created by Cristian Kocza on 23/06/2020.
//  Copyright © 2020 cristik. All rights reserved.
//

import SwiftUI
import TMDB

struct MovieCollectionView: View {
    let configuration: Configuration
    
    @StateObject private var state = State()
    
    init(configuration: Configuration) {
        self.configuration = configuration
    }

    var body: some View {
        List {
            ForEach(state.movies) { movie in
                NavigationLink(
                    destination: MovieDetailsView(movie: movie)
                ) {
                    MovieCellView(context: .init(api: configuration.api, movie: movie))
                }
            }
        }
        .navigationBarTitle(Text(configuration.title))
        .onAppear { state.fetch(api: configuration.api, moviesRequest: configuration.moviesRequest) }
    }
}

extension MovieCollectionView {
    typealias MoviesRequest = TMDB.API.Request<MoviesCollectionResponse>
    
    struct Configuration {
        let title: String
        let api: TMDB.API
        let moviesRequest: MoviesRequest
    }
    
    private class State: ObservableObject {
        @Published var movies = [TMDB.Movie]()
        
        // Don't do this in init
        func fetch(api: TMDB.API, moviesRequest: TMDB.API.Request<MoviesCollectionResponse>) {
            api.send(request: moviesRequest) {
                if case let .success(moviesResult) = $0 {
                    DispatchQueue.main.async {
                        self.movies = moviesResult.results
                    }
                }
            }
        }
    }
}
