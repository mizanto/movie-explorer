//
//  MovieCard.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import SwiftUI

struct MovieCard: View {
    let movie: MovieListItem

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let backdropPath = movie.backdropPath {
                LoadableImage(path: backdropPath, height: 240)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .padding(.top, 8)

                Text("Rating: \(movie.voteAverage, specifier: "%.1f")")
                    .font(.subheadline)

                Text("Genres: Unknown")
                    .font(.footnote)
                    .padding(.bottom, 8)
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    MovieCard(movie: MovieListItem.sample)
}
