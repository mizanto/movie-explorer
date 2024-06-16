//
//  NetworkError.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 16.06.2024.
//

import Foundation

extension NetworkClient {
    enum NetworkError: Error {
        case invalidResponse
        case invalidStatusCode(Int)
        case decodingError(Error)
        case invalidURL
    }
}
