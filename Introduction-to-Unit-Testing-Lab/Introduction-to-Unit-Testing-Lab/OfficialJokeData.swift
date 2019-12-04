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
    
}

