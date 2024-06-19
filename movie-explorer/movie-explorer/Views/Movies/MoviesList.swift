//
//  MoviesList.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import SwiftUI

struct MoviesList: View {
    let movies: [MovieItem]
    let currentPage: Int
    let totalPages: Int
    let onItemAppear: (MovieItem) async -> Void

    var body: some View {
        List {
            ForEach(movies) { movie in
                MovieCard(movie: movie)
                    .listRowSeparator(.hidden)
                    .task {
                        await onItemAppear(movie)
                    }
            }
            if currentPage < totalPages {
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
            movies: MovieItem.samples,
            currentPage: 1,
            totalPages: 3,
            onItemAppear: { _ in }
        )
    }
}
