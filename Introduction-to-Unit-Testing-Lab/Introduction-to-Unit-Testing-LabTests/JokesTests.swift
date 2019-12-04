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
    [
    {
        "id": 380,
        "type": "programming",
        "setup": "There are 10 kinds of people in this world.",
        "punchline": "Those who understand binary, those who don't, and those who weren't expecting a base 3 joke."
    },
    {
        "id": 382,
        "type": "programming",
        "setup": "What did the router say to the doctor?",
        "punchline": "It hurts when IP."
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


