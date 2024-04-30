//
//  player.swift
//  WordsGame
//
//  Created by Bit Bitin on 27.04.2024.
//

import Foundation

struct Player {
    
    let name: String
    private(set) var score = 0
    
    mutating func add(score: Int){
        self.score += score
        
    }
    
}
