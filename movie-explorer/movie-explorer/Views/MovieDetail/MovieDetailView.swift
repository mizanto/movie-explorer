//
//  MovieDetailView.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import SwiftUI

struct MovieDetailView: View {
    @EnvironmentObject private var viewModel: MovieDetailViewModel
    
    struct Model {
        let imagePath: String?
        let title: String
        let releaseDate: String?
        let genres: String?
        let rating: String
        let overview: String?
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if let errorMessage = viewModel.errorMessage {
                Text("Failed to load movie details: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    if let backdropPath = viewModel.model.imagePath {
                        LoadableImage(path: backdropPath, height: 240)
                    }
                    
                    Text(viewModel.model.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical, 4)
                    
                    if let releaseDate = viewModel.model.releaseDate {
                        InfoView(title: "Release Date:", value: releaseDate)
                    }
                    
                    if let genres = viewModel.model.genres {
                        InfoView(title: "Genres:", value: genres)
                    }
                    
                    InfoView(title: "Rating:", value: viewModel.model.rating)
                    
                    if let overview = viewModel.model.overview {
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

extension MovieDetailView {
    struct InfoView: View {
        let title: String
        let value: String
        
        var body: some View {
            HStack(alignment: .top) {
                Text(title).bold()
                Text(value)
            }
        }
    }
}
