//
//  Services.swift
//  TheMovieDB
//
//  Created by Onur Başdaş on 3.06.2022.
//

import Foundation


class Services {
    
    static func getUpComingModel(callback: @escaping (Result<[UpComingResult]?,Error>) -> Void) {
        var request = URLRequest(url: URL(string:ApiURLs.baseURL + "upcoming?" + ApiURLs.apiURL)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            do {
                let response = try JSONDecoder().decode(UpComingModel.self, from: data!)
                callback(.success(response.results ))

            } catch let e {
                callback(.failure(e))
            }
        }.resume()
    }
}
