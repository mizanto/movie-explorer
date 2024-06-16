//
//  Endpoint.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 16.06.2024.
//

import Foundation

extension NetworkClient {
    enum Endpoint: String {
        case popular
        
        var fullString: String {
            switch self {
                
            case .popular:
                return "\(movieBase)/popular"
            }
            
        }
        
        private var movieBase: String { "https://api.themoviedb.org/3/movie" }
    }
}
