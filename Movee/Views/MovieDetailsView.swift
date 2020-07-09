//
//  DetailsView.swift
//  CatsUI
//
//  Created by Cristian Kocza on 24/06/2020.
//  Copyright © 2020 cristik. All rights reserved.
//

import SwiftUI
import TMDB

struct MovieDetailsView: View {
    var movie: TMDB.Movie

    var body: some View {
        Group {
            Text(movie.title)
        }.navigationBarTitle(movie.title)
    }
}
