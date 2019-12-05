//
//  TriviaTests.swift
//  Introduction-to-Unit-Testing-LabTests
//
//  Created by Maitree Bain on 12/4/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import XCTest
@testable import Introduction_to_Unit_Testing_Lab

class TriviaTests: XCTestCase {
    
    let filename = "Trivia"
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
    
    func testTriviaData() {
        let data = dataStorage
        
        XCTAssertNotNil(data)
    }
    
    func testTriviaQuestions() {
        
        let firstQuestion = TriviaDataLoad.getTrivia().first?.question
        let expectedQuestion = "Who%20wrote%20and%20directed%20the%201986%20film%20%27Platoon%27%3F"
        
        XCTAssertEqual(firstQuestion, expectedQuestion, "\(firstQuestion ?? "") should be \(expectedQuestion)")
    }
    
    

}
