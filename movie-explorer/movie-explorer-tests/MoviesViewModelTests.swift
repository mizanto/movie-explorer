//
//  MoviesViewModelTests.swift
//  movie-explorer-tests
//
//  Created by Sergey Bendak on 20.06.2024.
//

import XCTest
@testable import movie_explorer

class MoviesViewModelTests: XCTestCase {
    var viewModel: MoviesViewModel!
    var mockClient: MockNetworkClient!
    
    override func setUp() {
        super.setUp()
        mockClient = MockNetworkClient()
        viewModel = MoviesViewModel(client: mockClient)
    }
    
    override func tearDown() {
        viewModel = nil
        mockClient = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertEqual(viewModel.state, .idle)
    }
    
    func testInitialLoadMoviesSuccess() async {
        await viewModel.initialLoadMovies()
        
        switch viewModel.state {
        case .loaded(let movies):
            XCTAssertEqual(movies.count, 10)
        default:
            XCTFail("Expected state to be .loaded, but got \(viewModel.state)")
        }
    }
    
    func testInitialLoadMoviesFailure() async {
        mockClient.shouldReturnError = true
        await viewModel.initialLoadMovies()
        
        switch viewModel.state {
        case .failed:
            XCTAssertTrue(true)
        default:
            XCTFail("Expected state to be .failed, but got \(viewModel.state)")
        }
    }
    
    func testLoadMoreMoviesIfNeededSuccess() async {
        await viewModel.initialLoadMovies()
        
        switch viewModel.state {
        case .loaded(let movies):
            let lastMovie = movies.last!
            await viewModel.loadMoreMoviesIfNeeded(current: lastMovie)
            
            if case .loaded(let newMovies) = viewModel.state {
                XCTAssertEqual(newMovies.count, 20)
            } else {
                XCTFail("Expected state to be .loaded with more movies, but got \(viewModel.state)")
            }
        default:
            XCTFail("Expected state to be .loaded, but got \(viewModel.state)")
        }
    }
    
    func testLoadMoreMoviesIfNeededFailure() async {
        await viewModel.initialLoadMovies()
        
        switch viewModel.state {
        case .loaded(let movies):
            mockClient.shouldReturnError = true
            let lastMovie = movies.last!
            await viewModel.loadMoreMoviesIfNeeded(current: lastMovie)
            
            if case .failed = viewModel.state {
                XCTAssertTrue(true)
            } else {
                XCTFail("Expected state to be .failed, but got \(viewModel.state)")
            }
        default:
            XCTFail("Expected state to be .loaded, but got \(viewModel.state)")
        }
    }
}
