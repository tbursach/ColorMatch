//
//  UserScore.swift
//  ColorMatch
//
//  Created by Trevor Bursach on 8/18/21.
//

import Foundation

class UserScore: Codable {
    
    let name: String
    let score: Int
    
    init (name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
