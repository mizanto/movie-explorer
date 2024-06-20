//
//  MoviesResponse.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 16.06.2024.
//

import Foundation

struct MoviesResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension MoviesResponse {
    static var mock: MoviesResponse {
        MoviesResponse(page: 1, 
                       results: Movie.mocks,
                       totalPages: 5,
                       totalResults: 100)
    }
}
