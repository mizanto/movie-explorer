//
//  Endpoint.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 16.06.2024.
//

import Foundation

extension NetworkClient {
    enum Endpoint {
        case popular(page: Int)
        
        var fullString: String {
            switch self {
            case .popular(let page):
                return "\(movieBase)/popular?page=\(page)"
            }
        }
        
        private var movieBase: String { "https://api.themoviedb.org/3/movie" }
    }
}
