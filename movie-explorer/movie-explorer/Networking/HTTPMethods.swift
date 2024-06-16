//
//  HTTPMethods.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 16.06.2024.
//

import Foundation

extension NetworkClient {
    enum HTTPMethod: String {
        case get
        case post
        
        var string: String {
            return rawValue.uppercased()
        }
    }
}
