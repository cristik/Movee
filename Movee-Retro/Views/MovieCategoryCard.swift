//
//  MovieCategoryCard.swift
//  Movee
//
//  Created by Cristian Kocza on 06/07/2020.
//

import SwiftUI

struct MovieCategoryCard: View {
    let title: String
    
    var body: some View {
        Text(title)
    }
    
    func colors(title: Color, start: Color, end: Color) -> some View{
        return body
            .foregroundColor(title)
            .padding(.init(top: 30, leading: 20, bottom: 30, trailing: 20))
            .background(LinearGradient(gradient: Gradient(colors: [start, end]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .padding(20)
    }
}


struct MovieCategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoryCard(title: "Popular")
            .colors(title: .white,
                    start: .red,
                    end: .purple).previewLayout(PreviewLayout.sizeThatFits)
    }
}
