//
//  AppEntryView.swift
//  Movee
//
//  Created by Cristian Kocza on 06/07/2020.
//

import SwiftUI
import TMDB
import SDWebImage

struct AppEntryView: View {
    let context: Context
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: "#2980B9"), Color(hex: "#6DD5FA")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                LazyVGrid(columns: columns) {
                    NavigationLink(destination: MovieCollectionView(context: .init(title: "Popular movies",
                                                                                   movieFetcher: { context.movieService.getPopularMovies(with: context.networkClient) },
                                                                                   imageService: context.imageService))) {
                        MovieCategoryCard(title: "Popular")
                            .colors(title: .white,
                                    start: Color(hex: "#373B44"),
                                    end: Color(hex: "#4286f4"))
                    }
                    NavigationLink(destination: MovieCollectionView(context: .init(title: "Top rated movies",
                                                                                   movieFetcher: { context.movieService.getTopRatedMovies(with: context.networkClient) },
                                                                                   imageService: context.imageService))) {
                        MovieCategoryCard(title: "Top Rated")
                            .colors(title: .white,
                                    start: Color(hex: "#c31432"),
                                    end: Color(hex: "#240b36"))
                    }
                    NavigationLink(destination: MovieCollectionView(context: .init(title: "Upcoming movies",
                                                                                   movieFetcher: { context.movieService.getUpcomingMovies(with: context.networkClient) },
                                                                                   imageService: context.imageService))) {
                        MovieCategoryCard(title: "Upcoming")
                            .colors(title: .white,
                                    start: Color(hex: "#ad5389"),
                                    end: Color(hex: "#3c1053"))
                    }
                    NavigationLink(destination: MovieCollectionView(context: .init(title: "Now playing movies",
                                                                                   movieFetcher: { context.movieService.getNowPlayingMovies(with: context.networkClient) },
                                                                                   imageService: context.imageService))) {
                        MovieCategoryCard(title: "Now Playing")
                            .colors(title: .white,
                                    start: Color(hex: "#23074d"),
                                    end: Color(hex: "#cc5333"))
                    }
                }
            }
            .navigationBarTitle(Text("Categories"))
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

extension AppEntryView {
    struct Context {
        let networkClient: NetworkClient
        let movieService: MovieService
        let imageService: ImageService
    }
}

struct AppEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AppEntryView(context: .init(networkClient: URLSession.shared,
                                    movieService: TMDB.API(apiKey: ""),
                                    imageService: SDWebImageManager.shared))
    }
}
