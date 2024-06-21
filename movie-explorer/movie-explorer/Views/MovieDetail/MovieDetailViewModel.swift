//
//  MovieDetailViewModel.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var model: MovieDetailView.Model
    @Published var errorMessage: String? = nil

    private let client: ClientProtocol
    
    private let movie: Movie

    init(client: ClientProtocol, movie: Movie) {
        self.client = client
        self.movie = movie
        self.model = MovieDetailView.Model(imagePath: movie.backdropPath,
                                           title: movie.title,
                                           releaseDate: nil,
                                           genres: nil,
                                           rating: String(format: "%.1f", movie.voteAverage),
                                           overview: nil)
    }

    @MainActor
    func loadMovieDetail() async {
        do {
            let movieDetail = try await client.getMovieDetail(id: movie.id)
            self.model = MovieDetailView.Model(
                imagePath: movieDetail.backdropPath,
                title: movieDetail.title,
                releaseDate: movieDetail.releaseDate,
                genres: movieDetail.genres?.joined(separator: ", "),
                rating: rating(average: movieDetail.voteAverage, count: movieDetail.voteCount),
                overview: movieDetail.overview)
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    private func rating(average: Double, count: Int? = nil) -> String {
        if let count = count {
            String(format: "%.1f (%d votes)", average, count)
        } else {
            String(format: "%.1f", average)
        }
    }
}
