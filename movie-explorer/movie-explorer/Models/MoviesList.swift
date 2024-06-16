//
//  MoviesList.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 16.06.2024.
//

import Foundation

struct MoviesList: Decodable {
    let page: Int
    let results: [MovieListItem]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
