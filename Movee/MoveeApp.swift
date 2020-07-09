//
//  MoveeApp.swift
//  Movee
//
//  Created by Cristian Kocza on 28/06/2020.
//

import SwiftUI
import TMDB

@main
struct MoveeApp: App {
    let api = TMDB.API(apiKey: "66815dba7abec14a91539c8e107e48fd")
    
    var body: some Scene {
        WindowGroup {
            AppEntryView(context: .init(api: api))
        }
    }
}
