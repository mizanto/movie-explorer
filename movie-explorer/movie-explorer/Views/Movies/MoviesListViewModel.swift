//
//  MoviesListViewModel.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import SwiftUI
import Combine

class MoviesListViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case loaded([MovieListItem])
        case failed(Error)
    }
    
    @Published var state: State = .idle
    private let client: Client

    init(client: Client) {
        self.client = client
    }

    func loadMovies() async {
        state = .loading
        do {
            let fetchedMovies = try await client.getPopularMovies()
            DispatchQueue.main.async {
                self.state = .loaded(fetchedMovies)
            }
        } catch {
            DispatchQueue.main.async {
                self.state = .failed(error)
            }
        }
    }
}
