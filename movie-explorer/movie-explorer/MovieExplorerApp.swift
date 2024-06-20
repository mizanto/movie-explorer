//
//  MovieExplorerApp.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import SwiftUI

@main
struct MovieExplorerApp: App {
    @StateObject private var client = NetworkClient()

    var body: some Scene {
        WindowGroup {
            let viewModel = MoviesViewModel(client: client)
            MoviesView()
                .environmentObject(viewModel)
        }
    }
}
