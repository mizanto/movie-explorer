//
//  MoviesList.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import SwiftUI

struct MoviesList: View {
    let movies: [Movie]
    let showLoading: Bool
    let onItemAppear: (Movie) async -> Void

    var body: some View {
        List {
            ForEach(movies) { movie in
                MovieCard(movie: movie)
                    .listRowSeparator(.hidden)
                    .task {
                        await onItemAppear(movie)
                    }
            }
            if showLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList(
            movies: Movie.mocks,
            showLoading: true,
            onItemAppear: { _ in }
        )
    }
}
