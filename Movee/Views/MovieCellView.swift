//
//  MovieCellView.swift
//  Movee
//
//  Created by Cristian Kocza on 26/06/2020.
//  Copyright © 2020 cristik. All rights reserved.
//

import SwiftUI
import TMDB
import SDWebImage

struct MovieCellView: View {
    @ObservedObject var context: Context
    
    init(context: Context) {
        self.context = context
    }
    
    var body: some View {
        HStack {
            Image(uiImage: context.image).resizable().frame(width: 80, height: 45)
            VStack(alignment: .leading) {
                Text(context.movie.title).font(.subheadline)
                RatingView(rating: context.movie.voteAverage / 2).font(.footnote).foregroundColor(.orange)
            }
        }.onAppear(perform: context.fetchImage)
    }
}

extension MovieCellView {
    class Context: ObservableObject {
        let api: TMDB.API
        let movie: TMDB.Movie
        
        @Published var image = UIImage()
        
        init(api: TMDB.API, movie: TMDB.Movie) {
            self.api = api
            self.movie = movie
        }
        
        func fetchImage() {
            guard let backdropPath = movie.backdropPath else { return }
            SDWebImageManager.shared.loadImage(with: api.imageUrl(for: backdropPath, size: "w300").url,
                                               options: [],
                                               progress: nil) { image, _, _, _, _, _ in
                if let image = image {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
