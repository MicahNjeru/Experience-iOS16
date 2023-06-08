//
//  DetailView.swift
//  Experience
//
//  Created by Micah Jesse Njeru on 07/06/2023.
//

import SwiftUI

struct DetailView: View {
    
    let movie: Movie
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var showingDeleteAlert = false
    
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
        .alert("Delete Movie", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteMovie)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this movie", systemImage: "trash")
            }
        }
    }
    
    func deleteMovie() {
        moc.delete(movie)
        
        try? moc.save()
        dismiss()
    }
}
