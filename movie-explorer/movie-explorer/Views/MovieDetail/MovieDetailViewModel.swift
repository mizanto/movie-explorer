//
//  MovieDetailViewModel.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case loaded(MovieDetail)
        case failed(String)
    }
    
    @Published var state: State = .idle

    private let client: ClientProtocol
    private let movie: Movie

    init(client: ClientProtocol, movie: Movie) {
        self.client = client
        self.movie = movie
        self.state = .loaded(
            MovieDetail(from: movie)
        )
    }

    @MainActor
    func loadMovieDetail() async {
        state = .loading
        do {
            let detail = try await client.getMovieDetail(id: movie.id)
            state = .loaded(detail)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}
