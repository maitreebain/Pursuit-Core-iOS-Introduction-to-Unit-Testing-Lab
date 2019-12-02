//
//  StarWarsData.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct StarWarsData: Codable {
    let results: [MovieInfo]
}

struct MovieInfo: Codable {
    let title: String
    let episode: Int
    let openingCrawl: String

private enum CodingKeys: String, CodingKey {
    case title
    case episode
    case openingCrawl = "opening_crawl"
}

}

extension StarWarsData {
    
    
    static func getMovieName() -> [MovieInfo] {
        var movieDetails = [MovieInfo]()
        
        guard let fileURL = Bundle.main.url(forResource: "StarWars", withExtension: "json")
            else {
                fatalError("error - no file found")
    }
        do {
            let data = try Data.init(contentsOf: fileURL)
            
            let movieData = try JSONDecoder().decode(StarWarsData.self, from: data)
            movieDetails = movieData.results
            
        } catch {
            fatalError("error: \(error)")
        }
        
        return movieDetails
}
    
    
    
}
