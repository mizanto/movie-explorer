//
//  MoviesView.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import SwiftUI

struct MoviesView: View {
    @StateObject private var viewModel: MoviesViewModel

    init(viewModel: MoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView("Loading movies...")
                case .loaded(let movies):
                    MoviesList(
                        movies: movies,
                        currentPage: viewModel.currentPage,
                        totalPages: viewModel.totalPages,
                        onItemAppear: { movie in
                            await viewModel.loadMoreMoviesIfNeeded(currentMovie: movie)
                        }
                    )
                case .failed(let error):
                    Text("Failed to fetch movies: \(error.localizedDescription)")
                }
            }
            .navigationBarTitle("Popular Movies")
        }
        .task {
            await viewModel.initialLoadMovies()
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        let client = MockNetworkClient()
        let viewModel = MoviesViewModel(client: client)
        
        MoviesView(viewModel: viewModel)
            .environmentObject(client)
    }
}
