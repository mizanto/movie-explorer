//
//  Endpoint.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 16.06.2024.
//

import Foundation

extension NetworkClient {
    enum Endpoint {
        case popularMovies(page: Int)
        case movieDetail(id: Int)
        
        var fullString: String {
            switch self {
            case .popularMovies(let page):
                return "\(movieBase)/popular?page=\(page)"
            case .movieDetail(let id):
                return "\(movieBase)/\(id)"
            }
        }
        
        private var movieBase: String { "https://api.themoviedb.org/3/movie" }
    }
}
