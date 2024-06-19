//
//  MoviesListView.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import SwiftUI

struct MoviesListView: View {
    @StateObject private var viewModel: MoviesListViewModel

    init(viewModel: MoviesListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .idle:
                    Text("Please wait...")
                        .onAppear {
                            Task {
                                await viewModel.loadMovies()
                            }
                        }
                case .loading:
                    ProgressView("Loading movies...")
                case .loaded(let movies):
                    List {
                        ForEach(movies) { movie in
                            MovieCard(movie: movie)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(PlainListStyle())
                case .failed(let error):
                    Text("Failed to fetch movies: \(error.localizedDescription)")
                }
            }
            .navigationBarTitle("Popular Movies")
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        let client = MockNetworkClient()
        let viewModel = MoviesListViewModel(client: client)
        
        MoviesListView(viewModel: viewModel)
            .environmentObject(client)
    }
}
