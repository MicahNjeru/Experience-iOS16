//
//  DetailView.swift
//  Experience
//
//  Created by Micah Jesse Njeru on 07/06/2023.
//

import SwiftUI

struct DetailView: View {
    
    let movie: Movie
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(movie.genre ?? "Comedy")
                    .resizable()
                    .scaledToFit()
                
                Text(movie.genre?.uppercased() ?? "COMEDY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(movie.director ?? "Unknown Director")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(movie.review ?? "No reviews")
                .padding()
            
            RatingView(rating: .constant(Int(movie.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(movie.title ?? "Unknown Movie")
        .navigationBarTitleDisplayMode(.inline)
    }
}
