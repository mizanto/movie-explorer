//
//  MovieDetailViewModel.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var movie: MovieDetail
    @Published var errorMessage: String? = nil

    private let client: ClientProtocol

    init(client: ClientProtocol, movie: Movie) {
        self.client = client
        self.movie = MovieDetail(from: movie)
    }

    @MainActor
    func loadMovieDetail() async {
        do {
            let movieDetail = try await client.getMovieDetail(id: movie.id)
            self.movie = movieDetail
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
