//
//  MovieDetailViewModelTests.swift
//  movie-explorer-tests
//
//  Created by Sergey Bendak on 20.06.2024.
//

import XCTest
@testable import movie_explorer

class MovieDetailViewModelTests: XCTestCase {
    var viewModel: MovieDetailViewModel!
    var mockClient: MockNetworkClient!
    let movie = Movie.mocks.first!
    
    override func setUp() {
        super.setUp()
        mockClient = MockNetworkClient()
        viewModel = MovieDetailViewModel(client: mockClient, movie: movie)
    }
    
    override func tearDown() {
        viewModel = nil
        mockClient = nil
        super.tearDown()
    }
    
    func testMovieDetailInitial() {
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.movie.id, movie.id)
        XCTAssertEqual(viewModel.movie.title, movie.title)
        XCTAssertNil(viewModel.movie.overview)
    }
    
    func testLoadMovieDetailSuccess() async {
        await viewModel.loadMovieDetail()
        
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.movie.id, MovieDetail.mock.id)
        XCTAssertEqual(viewModel.movie.title, MovieDetail.mock.title)
    }
    
    func testLoadMovieDetailFailure() async {
        mockClient.shouldReturnError = true
        await viewModel.loadMovieDetail()
        
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, NetworkClient.NetworkError.invalidResponse.localizedDescription)
    }
}
