//
//  MoveeApp.swift
//  Movee
//
//  Created by Cristian Kocza on 28/06/2020.
//

import SwiftUI
import TMDB
import SDWebImage

@main
struct MoveeApp: App {
    @StateObject var state = AppState()
    
    var body: some Scene {
        WindowGroup {
            AppEntryView(context: .init(networkClient: state.networkClient,
                                        movieService: state.tmdbApi,
                                        imageService: state.imageService))
        }
    }
}

class AppState: ObservableObject {
    let tmdbApi = TMDB.API(apiKey: "66815dba7abec14a91539c8e107e48fd")
    let networkClient = URLSession.shared
    let imageService = SDWebImageManager.shared
}
