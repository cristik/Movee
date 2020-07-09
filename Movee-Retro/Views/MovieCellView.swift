//
//  MovieCellView.swift
//  Movee
//
//  Created by Cristian Kocza on 26/06/2020.
//  Copyright © 2020 cristik. All rights reserved.
//

import SwiftUI
import Combine

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
                RatingView(rating: context.movie.rating).font(.footnote).foregroundColor(.orange)
            }
        }.onAppear(perform: context.fetchImage)
    }
}

extension MovieCellView {
    class Context: ObservableObject {
        let imageService: ImageService
        let movie: Movie
        
        @Published var image = UIImage()
        
        private var imageSubscription: Cancellable?
        
        init(imageService: ImageService, movie: Movie) {
            self.imageService = imageService
            self.movie = movie
        }
        
        func fetchImage() {
            guard let imageUrl = movie.imageUrl else { return }
            imageSubscription = imageService.downloadImage(withURL: imageUrl).sink(receiveCompletion: { _ in },
                                                                                   receiveValue: { self.image = $0 })
        }
    }
}
