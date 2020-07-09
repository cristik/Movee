//
//  AppEntryView.swift
//  Movee
//
//  Created by Cristian Kocza on 06/07/2020.
//

import SwiftUI
import TMDB

struct AppEntryView: View {
    let context: Context
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: "#2980B9"), Color(hex: "#6DD5FA")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                LazyVGrid(columns: columns) {
                    NavigationLink(destination: MovieCollectionView(configuration: .init(title: "Popular movies",
                                                                                         api: context.api,
                                                                                         moviesRequest: context.api.getPopularMovies()))) {
                        MovieCategoryCard(title: "Popular",
                                          titleColor: .white,
                                          startColor: Color(hex: "#373B44"),
                                          endColor: Color(hex: "#4286f4"))
                    }
                    NavigationLink(destination: MovieCollectionView(configuration: .init(title: "Top rated movies",
                                                                                         api: context.api,
                                                                                         moviesRequest: context.api.getTopRatedMovies()))) {
                        MovieCategoryCard(title: "Top Rated",
                                          titleColor: .white,
                                          startColor: Color(hex: "#c31432"),
                                          endColor: Color(hex: "#240b36"))
                    }
                    NavigationLink(destination: MovieCollectionView(configuration: .init(title: "Upcoming movies",
                                                                                         api: context.api,
                                                                                         moviesRequest: context.api.getUpcomingMovies()))) {
                        MovieCategoryCard(title: "Upcoming",
                                          titleColor: .white,
                                          startColor: Color(hex: "#ad5389"),
                                          endColor: Color(hex: "#3c1053"))
                    }
                    NavigationLink(destination: MovieCollectionView(configuration: .init(title: "Now playing movies",
                                                                                         api: context.api,
                                                                                         moviesRequest: context.api.getNowPlayingMovies()))) {
                        MovieCategoryCard(title: "Now Playing",
                                          titleColor: .white,
                                          startColor: Color(hex: "#23074d"),
                                          endColor: Color(hex: "#cc5333"))
                    }
                }
            }
            .navigationBarTitle(Text("Categories"))
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

extension AppEntryView {
    struct Context {
        let api: TMDB.API
    }
}

struct AppEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AppEntryView(context: .init(api: .init(apiKey: "")))
    }
}
