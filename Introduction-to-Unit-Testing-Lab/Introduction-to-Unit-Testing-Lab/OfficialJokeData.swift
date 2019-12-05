//
//  OfficialJokeData.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct JokeData: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
    
    static func getJokesData() -> [JokeData] {
         var jokes = [JokeData]()
        
        guard let fileURL = Bundle.main.url(forResource: "OfficialJoke", withExtension: "json") else {
            fatalError("no file found")
        }
         
         do {
            let data = try Data.init(contentsOf: fileURL)
            
            let jokesData = try JSONDecoder().decode([JokeData].self, from: data)
             jokes = jokesData
             } catch {
                 fatalError("decoding error:\(error)")
             }
     
         
         return jokes
     }
    
}

