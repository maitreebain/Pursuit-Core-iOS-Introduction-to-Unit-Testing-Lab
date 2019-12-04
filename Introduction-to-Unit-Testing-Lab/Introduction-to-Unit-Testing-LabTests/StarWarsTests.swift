//
//  StarWarsTests.swift
//  Introduction-to-Unit-Testing-LabTests
//
//  Created by Maitree Bain on 12/4/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import XCTest
@testable import Introduction_to_Unit_Testing_Lab

class StarWarsTests: XCTestCase {

    let filename = "StarWars"
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

    func testStarWarsData() {
        var data = dataStorage()
        
        XCTAssertNotNil(data)
    }
    
    func testSWPopulation() {
        var data = dataStorage()
        let firstTitle = StarWarsData.getMovieName().first?.title
        let expectedValue = "A New Hope"
        
        XCTAssertEqual(firstTitle, expectedValue, "\(firstTitle) should be \(expectedValue)")
        
    }
    
    
    
}
