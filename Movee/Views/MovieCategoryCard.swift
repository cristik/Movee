//
//  MovieCategoryCard.swift
//  Movee
//
//  Created by Cristian Kocza on 06/07/2020.
//

import SwiftUI

struct MovieCategoryCard: View {
    let title: String
    let titleColor: Color
    let startColor: Color
    let endColor: Color
    
    var body: some View {
        Text(title)
            .padding(.init(top: 30, leading: 20, bottom: 30, trailing: 20))
            .foregroundColor(titleColor)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .padding(20)
    }
}

struct MovieCategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoryCard(title: "Popular",
                          titleColor: .white,
                          startColor: .red,
                          endColor: .purple).previewLayout(PreviewLayout.sizeThatFits)
    }
}
