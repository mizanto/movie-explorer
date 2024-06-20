//
//  Movie.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import Foundation

struct Movie: Identifiable, Decodable {
    let id: Int
    let originalTitle: String
    let title: String
    let genreIds: [Int]
    let posterPath: String?
    let voteAverage: Double
    let backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case title
        case genreIds = "genre_ids"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
    }
}

extension Movie {
    static var sample: Movie {
        return Movie(
            id: 1022789,
            originalTitle: "Inside Out 2",
            title: "Inside Out 2",
            genreIds: [16, 10751, 18, 12, 35],
            posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
            voteAverage: 7.399,
            backdropPath: "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg"
        )
    }
    
    static var samples: [Movie] {
        return [
            Movie(
                id: 1022789,
                originalTitle: "Inside Out 2",
                title: "Inside Out 2",
                genreIds: [16, 10751, 18, 12, 35],
                posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
                voteAverage: 7.399,
                backdropPath: "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg"
            ),
            Movie(
                id: 653346,
                originalTitle: "Kingdom of the Planet of the Apes",
                title: "Kingdom of the Planet of the Apes",
                genreIds: [878, 12, 28],
                posterPath: "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
                voteAverage: 6.815,
                backdropPath: "/fqv8v6AycXKsivp1T5yKtLbGXce.jpg"
            ),
            Movie(
                id: 573435,
                originalTitle: "Bad Boys: Ride or Die",
                title: "Bad Boys: Ride or Die",
                genreIds: [28, 80, 53, 35],
                posterPath: "/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg",
                voteAverage: 6.976,
                backdropPath: "/gRApXuxWmO2forYTuTmcz5RaNUV.jpg"
            ),
            Movie(
                id: 1001311,
                originalTitle: "Sous la Seine",
                title: "Under Paris",
                genreIds: [53, 27, 28, 9648],
                posterPath: "/qZPLK5ktRKa3CL4sKRZtj8UlPYc.jpg",
                voteAverage: 5.8,
                backdropPath: "/hliXekHv7xc2cgXnMBLlp4Eihq8.jpg"
            ),
            Movie(
                id: 823464,
                originalTitle: "Godzilla x Kong: The New Empire",
                title: "Godzilla x Kong: The New Empire",
                genreIds: [878, 28, 12],
                posterPath: "/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg",
                voteAverage: 7.218,
                backdropPath: "/veIyxxi5Gs8gvztLEW1Ysb8rrzs.jpg"
            ),
            Movie(
                id: 955555,
                originalTitle: "범죄도시3",
                title: "The Roundup: No Way Out",
                genreIds: [28, 80, 35, 53],
                posterPath: "/lW6IHrtaATxDKYVYoQGU5sh0OVm.jpg",
                voteAverage: 7.02,
                backdropPath: "/vblTCXOWUQGSc837vgbhDRi4HSc.jpg"
            ),
            Movie(
                id: 929590,
                originalTitle: "Civil War",
                title: "Civil War",
                genreIds: [10752, 28, 18],
                posterPath: "/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
                voteAverage: 7.016,
                backdropPath: "/z121dSTR7PY9KxKuvwiIFSYW8cf.jpg"
            ),
            Movie(
                id: 626412,
                originalTitle: "외계+인 2부",
                title: "Alienoid: Return to the Future",
                genreIds: [878, 28, 14, 12],
                posterPath: "/4RClncz0GTKPZzSAcAalHCw0h3g.jpg",
                voteAverage: 6.612,
                backdropPath: "/kZbTOcTrEGyroQMWQSGIRlNSkwP.jpg"
            ),
            Movie(
                id: 719221,
                originalTitle: "Tarot",
                title: "Tarot",
                genreIds: [27, 53],
                posterPath: "/gAEUXC37vl1SnM7PXsHTF23I2vq.jpg",
                voteAverage: 6.48,
                backdropPath: "/oavbmL3iddJUmC8nQjL6bLHwAP4.jpg"
            ),
            Movie(
                id: 150540,
                originalTitle: "Inside Out",
                title: "Inside Out",
                genreIds: [16, 10751, 12, 18, 35],
                posterPath: "/2H1TmgdfNtsKlU9jKdeNyYL5y8T.jpg",
                voteAverage: 7.915,
                backdropPath: "/j29ekbcLpBvxnGk6LjdTc2EI5SA.jpg"
            )
        ]
    }
}
