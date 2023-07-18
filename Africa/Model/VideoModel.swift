//
//  VideoModel.swift
//  Africa
//
//  Created by wac on 14/07/23.
//

import Foundation

struct Video : Codable, Identifiable {
let id: String
let name: String
let headline: String
    
    // computed Property
    
    var thumbnail: String {
        "video-\(id)"
    }
}
