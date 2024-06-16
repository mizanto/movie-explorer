//
//  NetworkClient.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 16.06.2024.
//

import Foundation

protocol Client {
    func getPopularMovies() async throws -> [MovieListItem]
}

class NetworkClient {
    private let apiKey = "a38d664ad8efeeb1f09d71ea36e78256"
    
    func sendRequest<T: Decodable>(
        endpoint: Endpoint, method: HTTPMethod = .get, timeoutInterval: TimeInterval = 30
    ) async throws -> T {
        let url = try url(for: endpoint)
        let request = request(for: url, method: method, timeoutInterval: timeoutInterval)
        let (data, response) = try await URLSession.shared.data(for: request)
        return try parse(data: data, response: response)
    }
    
    private func url(for endpoint: Endpoint) throws -> URL {
        guard var urlComponents = URLComponents(string: endpoint.fullString) else {
            throw NetworkError.invalidURL
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        return url
    }
    
    private func request(for url: URL, method: HTTPMethod, timeoutInterval: TimeInterval) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.string
        request.timeoutInterval = timeoutInterval
        request.allHTTPHeaderFields = ["accept": "application/json"]
        return request
    }
    
    private func parse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkError.invalidStatusCode(httpResponse.statusCode)
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}

extension NetworkClient: Client {
    func getPopularMovies() async throws -> [MovieListItem] {
        let list: MoviesList = try await sendRequest(endpoint: .popular)
        return list.results
    }
}
