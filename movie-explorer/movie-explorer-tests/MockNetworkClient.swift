//
//  MockNetworkClient.swift
//  movie-explorer-tests
//
//  Created by Sergey Bendak on 20.06.2024.
//

import Foundation
@testable import movie_explorer

class MockNetworkClient: ClientProtocol {
    var shouldReturnError = false
    
    func getPopularMovies(page: Int) async throws -> MoviesResponse {
        if shouldReturnError {
            throw NetworkClient.NetworkError.invalidResponse
        }
        
        return MoviesResponse.mock
    }
    
    func getMovieDetail(id: Int) async throws -> MovieDetail {
        if shouldReturnError {
            throw NetworkClient.NetworkError.invalidResponse
        }
        
        return MovieDetail.mock
    }
}
