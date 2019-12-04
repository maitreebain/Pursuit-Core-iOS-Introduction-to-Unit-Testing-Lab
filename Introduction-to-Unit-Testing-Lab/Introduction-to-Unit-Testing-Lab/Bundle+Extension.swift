//
//  Bundle+Extension.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/4/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

extension Bundle {
    
    static func readRawJsonData(filename: String, ext: String) -> Data {
        
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("no file found \(filename) \(ext)")
        }
        var data: Data!
        
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("contents not found: \(error)")
        }
        
        return data
    }
    
}
