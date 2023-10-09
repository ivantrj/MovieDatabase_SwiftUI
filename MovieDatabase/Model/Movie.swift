//
//  Movie.swift
//  MovieDatabase
//
//  Created by ivan ruwido  on 09.10.23.
//

import Foundation

    
struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let overview: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case releaseDate = "release_date"
        case overview
        case posterPath = "poster_path"
    }
}

struct MockData {
    static let sampleMovie = Movie(id: 0001,
                                   title: "Fight Club",
                                   releaseDate: "1997-07-18",
                                   overview: "test description",
                                   posterPath: ""
                                   )
    
    static let movies = [sampleMovie, sampleMovie, sampleMovie, sampleMovie]

}
