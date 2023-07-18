//
//  CodableBundleExtention.swift
//  Africa
//
//  Created by wac on 14/07/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to load \(file) in bundle")
        }
        
        
        // 2. create the property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) from bundle")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("faild to load \(file) from bundle.")
        }
        // 5. return the ready-to-use data
        return loaded
    }
}
