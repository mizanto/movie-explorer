//
//  MoviesListView.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import SwiftUI

struct MoviesListView: View {
    @State private var movies: [MovieListItem] = []

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
        .task {
            await loadMovies()
        }
    }
    
    private func loadMovies() async {
        let client = NetworkClient()
        do {
            let fetchedMovies = try await client.getPopularMovies()
            movies = fetchedMovies
        } catch {
            print("Failed to fetch movies: \(error)")
        }
    }
}

#Preview {
    MoviesListView()
}
