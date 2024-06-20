//
//  MovieCard.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie

    var body: some View {
        ZStack(alignment: .bottom) {
            if let backdropPath = movie.backdropPath {
                LoadableImage(path: backdropPath, height: 320)
            }

            HStack {
                Text(movie.title)
                    .font(.title3)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text("\(movie.voteAverage, specifier: "%.1f")")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .padding(4)
                    .background(color(for: movie.voteAverage))
                    .cornerRadius(4)

                
            }
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.black.opacity(1.0),
                                 Color.black.opacity(0.6),
                                 Color.black.opacity(0.0)]
                    ),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    private func color(for rating: Double) -> Color {
        rating < 6 ? .red : .green
    }
}

#Preview {
    MovieCard(movie: Movie.mock)
}
