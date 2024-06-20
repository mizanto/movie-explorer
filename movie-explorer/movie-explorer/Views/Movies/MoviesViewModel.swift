//
//  MoviesViewModel.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import SwiftUI
import Combine

class MoviesViewModel: ObservableObject {
    enum State: Equatable {
        case idle
        case loading
        case loaded([Movie])
        case failed(String)
        
        static func ==(lhs: State, rhs: State) -> Bool {
            switch (lhs, rhs) {
            case (.idle, .idle),
                 (.loading, .loading):
                return true
            case (.loaded(let lhsMovies), .loaded(let rhsMovies)):
                return lhsMovies == rhsMovies
            case (.failed(let lhsError), .failed(let rhsError)):
                return lhsError == rhsError
            default:
                return false
            }
        }
    }
    
    @Published var state: State = .idle
    let client: ClientProtocol
    private var currentPage = 1
    private var totalPages = 1
    
    var showLoading: Bool {
        currentPage < totalPages
    }

    init(client: ClientProtocol) {
        self.client = client
    }

    @MainActor
    func initialLoadMovies() async {
        state = .loading
        do {
            let movieList = try await client.getPopularMovies(page: currentPage)
            self.state = .loaded(movieList.results)
            self.totalPages = movieList.totalPages
        } catch {
            self.state = .failed(error.localizedDescription)
        }
    }

    @MainActor
    func loadMoreMoviesIfNeeded(current movie: Movie) async {
        guard currentPage < totalPages else { return }
        
        if case .loaded(let movies) = state, let lastMovie = movies.last {
            if lastMovie.id == movie.id {
                currentPage += 1
                do {
                    let movieList = try await client.getPopularMovies(page: currentPage)
                    if case .loaded(let movies) = self.state {
                        self.state = .loaded(movies + movieList.results)
                    }
                    self.totalPages = movieList.totalPages
                } catch {
                    self.state = .failed(error.localizedDescription)
                }
            }
        }
    }
    
    func detailViewModel(for movie: Movie) -> MovieDetailViewModel {
        MovieDetailViewModel(client: client, movie: movie)
    }
}
