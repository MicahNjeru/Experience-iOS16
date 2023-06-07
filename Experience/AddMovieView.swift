//
//  AddMovieView.swift
//  Experience
//
//  Created by Micah Jesse Njeru on 07/06/2023.
//

import SwiftUI

struct AddMovieView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var director = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    
    let genres = ["Action", "Comedy", "Drama", "Horror", "Thriller", "Adventure", "Science Fiction", "Documentary"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of movie", text: $title)
                    TextField("Director's name", text: $director)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    
                    Picker("Rating", selection: $rating) {
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newMovie = Movie(context: moc)
                        newMovie.id = UUID()
                        newMovie.title = title
                        newMovie.director = director
                        newMovie.rating = Int16(rating)
                        newMovie.genre = genre
                        newMovie.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Movie")
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
