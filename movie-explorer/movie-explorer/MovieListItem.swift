//
//  MovieListItem.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 15.06.2024.
//

import Foundation

struct MovieListItem: Identifiable, Decodable {
    let id: Int
    let original_title: String
    let title: String
    let genre_ids: [Int]
    let poster_path: String?
    let vote_average: Double
    let backdrop_path: String?
}

extension MovieListItem {
    static var sample: MovieListItem {
        return MovieListItem(
            id: 1022789,
            original_title: "Inside Out 2",
            title: "Inside Out 2",
            genre_ids: [16, 10751, 18, 12, 35],
            poster_path: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
            vote_average: 7.399,
            backdrop_path: "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg"
        )
    }
    
    static var samples: [MovieListItem] {
        return [
            MovieListItem(
                id: 1022789,
                original_title: "Inside Out 2",
                title: "Inside Out 2",
                genre_ids: [16, 10751, 18, 12, 35],
                poster_path: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
                vote_average: 7.399,
                backdrop_path: "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg"
            ),
            MovieListItem(
                id: 653346,
                original_title: "Kingdom of the Planet of the Apes",
                title: "Kingdom of the Planet of the Apes",
                genre_ids: [878, 12, 28],
                poster_path: "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
                vote_average: 6.815,
                backdrop_path: "/fqv8v6AycXKsivp1T5yKtLbGXce.jpg"
            ),
            MovieListItem(
                id: 573435,
                original_title: "Bad Boys: Ride or Die",
                title: "Bad Boys: Ride or Die",
                genre_ids: [28, 80, 53, 35],
                poster_path: "/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg",
                vote_average: 6.976,
                backdrop_path: "/gRApXuxWmO2forYTuTmcz5RaNUV.jpg"
            ),
            MovieListItem(
                id: 1001311,
                original_title: "Sous la Seine",
                title: "Under Paris",
                genre_ids: [53, 27, 28, 9648],
                poster_path: "/qZPLK5ktRKa3CL4sKRZtj8UlPYc.jpg",
                vote_average: 5.8,
                backdrop_path: "/hliXekHv7xc2cgXnMBLlp4Eihq8.jpg"
            ),
            MovieListItem(
                id: 823464,
                original_title: "Godzilla x Kong: The New Empire",
                title: "Godzilla x Kong: The New Empire",
                genre_ids: [878, 28, 12],
                poster_path: "/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg",
                vote_average: 7.218,
                backdrop_path: "/veIyxxi5Gs8gvztLEW1Ysb8rrzs.jpg"
            ),
            MovieListItem(
                id: 955555,
                original_title: "범죄도시3",
                title: "The Roundup: No Way Out",
                genre_ids: [28, 80, 35, 53],
                poster_path: "/lW6IHrtaATxDKYVYoQGU5sh0OVm.jpg",
                vote_average: 7.02,
                backdrop_path: "/vblTCXOWUQGSc837vgbhDRi4HSc.jpg"
            ),
            MovieListItem(
                id: 929590,
                original_title: "Civil War",
                title: "Civil War",
                genre_ids: [10752, 28, 18],
                poster_path: "/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
                vote_average: 7.016,
                backdrop_path: "/z121dSTR7PY9KxKuvwiIFSYW8cf.jpg"
            ),
            MovieListItem(
                id: 626412,
                original_title: "외계+인 2부",
                title: "Alienoid: Return to the Future",
                genre_ids: [878, 28, 14, 12],
                poster_path: "/4RClncz0GTKPZzSAcAalHCw0h3g.jpg",
                vote_average: 6.612,
                backdrop_path: "/kZbTOcTrEGyroQMWQSGIRlNSkwP.jpg"
            ),
            MovieListItem(
                id: 719221,
                original_title: "Tarot",
                title: "Tarot",
                genre_ids: [27, 53],
                poster_path: "/gAEUXC37vl1SnM7PXsHTF23I2vq.jpg",
                vote_average: 6.48,
                backdrop_path: "/oavbmL3iddJUmC8nQjL6bLHwAP4.jpg"
            ),
            MovieListItem(
                id: 150540,
                original_title: "Inside Out",
                title: "Inside Out",
                genre_ids: [16, 10751, 12, 18, 35],
                poster_path: "/2H1TmgdfNtsKlU9jKdeNyYL5y8T.jpg",
                vote_average: 7.915,
                backdrop_path: "/j29ekbcLpBvxnGk6LjdTc2EI5SA.jpg"
            )
        ]
    }
}
