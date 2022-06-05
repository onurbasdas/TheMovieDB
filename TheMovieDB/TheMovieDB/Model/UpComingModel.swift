//
//  UpComingModel.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 3.06.2022.
//

import Foundation

struct UpComingModel: Codable {
    var dates: UpComingResult?
    var page: Int?
    var results: [UpComingResult]
}

struct UpComingResultDates : Codable {
    var maximum: String?
    var minimum: String?
}

struct UpComingResult: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Float?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int?
}

