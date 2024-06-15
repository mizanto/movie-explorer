//
//  MoviesListView.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import SwiftUI

struct MoviesListView: View {
    @State private var movies: [MovieListItem] = MovieListItem.samples

    var body: some View {
        NavigationView {
            List {
                ForEach(movies) { movie in
                    MovieCard(movie: movie)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Popular Movies")
        }
    }
}

#Preview {
    MoviesListView()
}
