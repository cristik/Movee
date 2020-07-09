//
//  ContentView.swift
//  CatsUI
//
//  Created by Cristian Kocza on 23/06/2020.
//  Copyright © 2020 cristik. All rights reserved.
//

import SwiftUI
import Combine

struct MovieCollectionView: View {
    let context: Configuration
    @StateObject private var state = State()
    
    init(context: Configuration) {
        self.context = context
    }

    var body: some View {
        List {
            ForEach(state.movies) { movie in
                NavigationLink(
                    destination: MovieDetailsView(movie: movie)
                ) {
                    MovieCellView(context: .init(imageService: self.context.imageService, movie: movie))
                }
            }
        }
        .navigationBarTitle(Text(context.title))
        .onAppear { state.fetch(context.movieFetcher) }
    }
}

extension MovieCollectionView {
    struct Configuration {
        let title: String
        let movieFetcher: () -> AnyPublisher<[Movie], Error>
        let imageService: ImageService
    }
    
    private class State: ObservableObject {
        @Published var movies = [Movie]()
        
        private var fetchSubscription: Cancellable?
        
        // Don't call this from view init
        func fetch(_ movieFetcher: @escaping() -> AnyPublisher<[Movie], Error>) {
            guard fetchSubscription == nil else { return }
            fetchSubscription = movieFetcher().sink(receiveCompletion: { _ in },
                                                    receiveValue: {
                                                        self.movies = $0
                                                    })
        }
    }
}

