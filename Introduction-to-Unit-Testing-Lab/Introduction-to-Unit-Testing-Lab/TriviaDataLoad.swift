//
//  TriviaDataLoad.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/4/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct TriviaDataLoad: Codable {
    let results: [TriviaData]
}

struct TriviaData: Codable {
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    let difficulty: String
}

private enum Rename: String, CodingKey {
    case question
    case difficulty
    case correct = "correct_answer"
    case incorrect = "incorrect_answers"
}



extension TriviaDataLoad {
    
    static func getTrivia() -> [TriviaData] {
        var trivia = [TriviaData]()
        
        guard let fileURL = Bundle.main.url(forResource: "Trivia", withExtension: "json") else {
            fatalError("no file found")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            
            let triviaInfo = try JSONDecoder().decode(TriviaDataLoad.self, from: data)
            trivia = triviaInfo.results
        }
        catch {
            fatalError("no data loaded \(error)")
        }
        
        return trivia
    }
    
}
