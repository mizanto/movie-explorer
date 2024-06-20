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
            switch viewModel.state {
            case .idle, .loading:
                ProgressView("Loading movie details...")
            case .loaded(let movie):
                VStack(alignment: .leading, spacing: 8) {
                    if let backdropPath = movie.backdropPath {
                        LoadableImage(path: backdropPath, height: 240)
                    }
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical, 4)
                    if let releaseDate = movie.releaseDate {
                        HStack {
                            Text("Release Date:")
                                .bold()
                            Text(releaseDate)
                        }
                    }
                    if let genres = movie.genres {
                        HStack(alignment: .top) {
                            Text("Genres:")
                                .bold()
                            Text(genres.joined(separator: ", "))
                        }
                    }
                    HStack {
                        Text("Rating:")
                            .bold()
                        if let voteCount = movie.voteCount {
                            Text("\(movie.voteAverage, specifier: "%.1f") (\(voteCount) votes)")
                        } else {
                            Text("\(movie.voteAverage, specifier: "%.1f")")
                        }
                    }
                    if let overview = movie.overview {
                        Text(overview)
                            .font(.system(size: 21))
                            .padding(.vertical, 4)
                    }
                    
                    Spacer()
                }
            case .failed(let errorMessage):
                Text("Failed to load movie details: \(errorMessage)")
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadMovieDetail()
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let client = MockNetworkClient()
//        let viewModel = MovieDetailViewModel(client: client, movie: Movie.sample)
//        MovieDetailView()
//            .environmentObject(viewModel)
//    }
//}
