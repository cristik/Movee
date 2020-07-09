//
//  RatingView.swift
//  Movee
//
//  Created by Cristian Kocza on 04/07/2020.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    
    init(rating: Double) {
        self.rating = max(0, min(5, rating))
    }
    
    var body: some View {
        HStack {
            Image(systemName: rating < 0.25 ? "star" : rating < 0.75 ? "star.lefthalf.fill" : "star.fill")
            Image(systemName: rating < 1.25 ? "star" : rating < 1.75 ? "star.lefthalf.fill" : "star.fill")
            Image(systemName: rating < 2.25 ? "star" : rating < 2.75 ? "star.lefthalf.fill" : "star.fill")
            Image(systemName: rating < 3.25 ? "star" : rating < 3.75 ? "star.lefthalf.fill" : "star.fill")
            Image(systemName: rating < 4.25 ? "star" : rating < 4.75 ? "star.lefthalf.fill" : "star.fill")
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RatingView(rating: 0.2).previewLayout(PreviewLayout.sizeThatFits)
            RatingView(rating: 0.7).previewLayout(PreviewLayout.sizeThatFits)
            RatingView(rating: 1.1).previewLayout(PreviewLayout.sizeThatFits)
            RatingView(rating: 1.7).previewLayout(PreviewLayout.sizeThatFits)
            RatingView(rating: 2.0).previewLayout(PreviewLayout.sizeThatFits)
            RatingView(rating: 2.5).previewLayout(PreviewLayout.sizeThatFits)
            RatingView(rating: 2.9).previewLayout(PreviewLayout.sizeThatFits)
            RatingView(rating: 3.25).previewLayout(PreviewLayout.sizeThatFits)
            RatingView(rating: 4).previewLayout(PreviewLayout.sizeThatFits)
            RatingView(rating: 4.5).previewLayout(PreviewLayout.sizeThatFits)
            //RatingView(rating: 5)
        }
    }
}
