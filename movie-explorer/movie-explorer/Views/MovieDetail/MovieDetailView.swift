//
//  MovieDetailView.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import SwiftUI

struct MovieDetailView: View {
    @EnvironmentObject private var viewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if let errorMessage = viewModel.errorMessage {
                Text("Failed to load movie details: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    if let backdropPath = viewModel.movie.backdropPath {
                        LoadableImage(path: backdropPath, height: 240)
                    }
                    Text(viewModel.movie.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical, 4)
                    if let releaseDate = viewModel.movie.releaseDate {
                        HStack {
                            Text("Release Date:")
                                .bold()
                            Text(releaseDate)
                        }
                    }
                    if let genres = viewModel.movie.genres {
                        HStack(alignment: .top) {
                            Text("Genres:")
                                .bold()
                            Text(genres.joined(separator: ", "))
                        }
                    }
                    HStack {
                        Text("Rating:")
                            .bold()
                        if let voteCount = viewModel.movie.voteCount {
                            Text("\(viewModel.movie.voteAverage, specifier: "%.1f") (\(voteCount) votes)")
                        } else {
                            Text("\(viewModel.movie.voteAverage, specifier: "%.1f")")
                        }
                    }
                    if let overview = viewModel.movie.overview {
                        Text(overview)
                            .font(.system(size: 21))
                            .padding(.vertical, 4)
                    }
                    
                    Spacer()
                }
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadMovieDetail()
        }
    }
}
