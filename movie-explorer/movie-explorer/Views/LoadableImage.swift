//
//  LoadableImage.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 18.06.2024.
//

import SwiftUI

struct LoadableImage: View {
    let path: String
    var height: CGFloat = 240
    var size: Size = .w780
    
    private let basePath = "https://image.tmdb.org/t/p/"
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: url(size: size, path: path)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: height)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(width: geometry.size.width, height: height)
            }
        }
        .frame(height: height)
    }
    
    private func url(size: Size, path: String) -> URL? {
        URL(string: basePath + size.rawValue + path)
    }
}

extension LoadableImage {
    enum Size: String {
        case w92
        case w154
        case w185
        case w342
        case w500
        case w780
        case original
    }
}

#Preview {
    LoadableImage(path: "/coATv42PoiLqAFKStJiMZs2r6Zb.jpg", height: 240)
}
