//
//  MoviesView.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject private var viewModel: MoviesViewModel
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView("Loading movies...")
                case .loaded(let movies):
                    List {
                        ForEach(movies) { movie in
                            ZStack {
                                NavigationLink(
                                    destination: MovieDetailView()
                                        .environmentObject(viewModel.detailViewModel(for: movie)),
                                    label: {
                                        EmptyView()
                                    }
                                )
                                
                                MovieCard(movie: movie)
                            }
                            .listRowSeparator(.hidden)
                            .task {
                                await viewModel.loadMoreMoviesIfNeeded(current: movie)
                            }
                        }
                        if viewModel.showLoading {
                            ProgressView()
                                .frame(maxWidth: .infinity)
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
        .task {
            await viewModel.initialLoadMovies()
        }
    }
}

struct EmptyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}
