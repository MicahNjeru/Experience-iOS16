//
//  AddMovieView.swift
//  Experience
//
//  Created by Micah Jesse Njeru on 07/06/2023.
//

import SwiftUI

struct AddMovieView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var title = ""
    @State private var director = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    
    let genres = ["Action", "Comedy", "Drama", "Horror", "Thriller", "Adventure", "Science Fiction", "Documentary"]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
