//
//  JokesTests.swift
//  Introduction-to-Unit-Testing-LabTests
//
//  Created by Maitree Bain on 12/4/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import XCTest
@testable import Introduction_to_Unit_Testing_Lab

class JokesTests: XCTestCase {

    let filename = "OfficialJoke"
    let ext = "json"
    
    func dataStorage() {
        let data = Bundle.readRawJsonData(filename: filename, ext: ext)
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testgetRawData() {
        let data = dataStorage()
       
       XCTAssertNotNil(data)
       }
    
    func testJokePopulation() {
            let jsonData = """
    [{
    "id": 73,
    "type": "programming",
        "setup": "The punchline often arrives before the set-up.",
        "punchline": "Do you know the problem with UDP jokes?"

    },
    {
        "id": 379,
        "type": "programming",
        "setup": "A programmer puts two glasses on his bedside table before going to sleep.",
        "punchline": "A full one, in case he gets thirsty, and an empty one, in case he doesn’t."
    }]
    """.data(using: .utf8)!
            let expectedJokesCount = 2
            
            do {
                let jokes = try JSONDecoder().decode([JokeData].self, from: jsonData)
                XCTAssertEqual(jokes.count, expectedJokesCount, "there should be \(expectedJokesCount) created")
            } catch {
                XCTFail("decoding error: \(error)")
            
        
        }

    }
    

}


