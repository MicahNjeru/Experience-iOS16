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
    var body: some View {
        VStack {
            List(movies) { movie in
                Text(movie.title ?? "Unknown")
            }
            
            Button("Add") {
                let title = ["John Wick 1", "John Wick 2", "John Wick 3", "John Wick 1", "Guardians of the Galaxy vol 1", "Guardians of the Galaxy vol 2"]
                
                let chosenTitle = title.randomElement()!
                
                let movie  = Movie(context: moc)
                movie.id = UUID()
                movie.title = "\(chosenTitle)"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
