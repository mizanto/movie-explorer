//
//  MovieDetail.swift
//  movie-explorer
//
//  Created by Sergey Bendak on 19.06.2024.
//

import Foundation

struct MovieDetail: Codable {
    let backdropPath: String?
    let budget: Int?
    let genres: [String]?
    let id: Int
    let originCountry: [String]?
    let originalTitle: String
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let revenue: Int?
    let status: String?
    let title: String
    let voteAverage: Double
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case id
        case originCountry = "origin_country"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue
        case status
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    struct Genre: Codable {
        let name: String
    }
    
    init(backdropPath: String?, budget: Int?, genres: [String]?, id: Int, originCountry: [String]?,
         originalTitle: String, overview: String?, posterPath: String?, releaseDate: String?,
         revenue: Int?, status: String?, title: String, voteAverage: Double, voteCount: Int?) {
        self.backdropPath = backdropPath
        self.budget = budget
        self.genres = genres
        self.id = id
        self.originCountry = originCountry
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.status = status
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        budget = try container.decodeIfPresent(Int.self, forKey: .budget)
        let genreObjects = try container.decodeIfPresent([Genre].self, forKey: .genres)
        genres = genreObjects?.map { $0.name }
        id = try container.decode(Int.self, forKey: .id)
        originCountry = try container.decodeIfPresent([String].self, forKey: .originCountry)
        originalTitle = try container.decode(String.self, forKey: .originalTitle)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        revenue = try container.decodeIfPresent(Int.self, forKey: .revenue)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        title = try container.decode(String.self, forKey: .title)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    }

    init(from movie: Movie) {
        self.backdropPath = movie.backdropPath
        self.budget = nil
        self.genres = nil
        self.id = movie.id
        self.originCountry = nil
        self.originalTitle = movie.originalTitle
        self.overview = nil
        self.posterPath = movie.posterPath
        self.releaseDate = nil
        self.revenue = nil
        self.status = nil
        self.title = movie.title
        self.voteAverage = movie.voteAverage
        self.voteCount = nil
    }
}

extension MovieDetail {
    static var mock: MovieDetail {
        return MovieDetail(
            backdropPath: "/wSGF90Ki9bDaUWsAICtqQh0uqJy.jpg",
            budget: 0,
            genres: ["Animation", "Family"],
            id: 355338,
            originCountry: ["US"],
            originalTitle: "Riley's First Date?",
            overview: "Riley, now 12, who is hanging out with her parents at home when potential trouble comes knocking. Mom's and Dad's Emotions find themselves forced to deal with Riley going on her first \"date.\"",
            posterPath: "/cGLwfmLqg39822RFQMUDat0UJev.jpg",
            releaseDate: "2015-11-03",
            revenue: 0,
            status: "Released",
            title: "Riley's First Date?",
            voteAverage: 7.2,
            voteCount: 790
        )
    }
}
