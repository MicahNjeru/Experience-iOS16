//
//  ContentView.swift
//  Experience
//
//  Created by Micah Jesse Njeru on 06/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<Movie>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies) { movie in
                    NavigationLink {
                        Text(movie.title ?? "Unknown Title")
                    } label: {
                        HStack {
                            EmojiRatingView(rating: movie.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(movie.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(movie.director ?? "Unknown Director")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Movie")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Movie", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddMovieView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
