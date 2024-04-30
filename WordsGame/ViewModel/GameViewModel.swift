//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Bit Bitin on 27.04.2024.
//

import Foundation

enum WordError: Error {
    case theSameWord
    case beforeWord
    case litleWord
    case wrongWord
    case undefindWord
}

class GameViewModel: ObservableObject {
    
    @Published var player1: Player
    @Published var player2: Player
    @Published var words = [String]()
    let word: String
    var isFirst = true
    
    init(player1: Player,player2: Player, word:String){
        self.player1 = player1
        self.player2 = player2
        self.word = word.uppercased()
    }
    
    func validate(word: String) throws {
        let word = word.uppercased()
        
        guard word != self.word else {
            print("не прокатит бро!")
            throw WordError.theSameWord
        }
        
        guard !(words.contains(word)) else {
            print("ПОВТОРЕНИЕ")
            throw WordError.beforeWord
        }
        
        guard word.count > 1 else {
            print("мало букв")
            throw WordError.litleWord
        }
        return
    }
    
    func wordToChars(word:String) -> [Character] {
        var chars = [Character]()
        for char in word.uppercased() {
            chars.append(char)
        }
        return chars
    }
    
    func check(word: String) throws -> Int {
        do {
            try self.validate(word: word)
        } catch {
            throw error
        }
        
        var bigWordArray = wordToChars(word: self.word)
        let smallWordArray = wordToChars(word: word)
        var result = ""
        
        for char in smallWordArray {
            if bigWordArray.contains(char) {
                result.append(char)
                var i = 0
                while bigWordArray[i] != char {
                    i += 1
                }
                bigWordArray.remove(at: i)
            } else {
                throw WordError.wrongWord
            }
        }
        guard result == word.uppercased() else{
            print("unknown error")
            return 0
        }
        words.append(result)
        if isFirst {
            player1.add(score: result.count)
        } else {
            player2.add(score: result.count)
        }
        
        isFirst.toggle()
        
        return result.count
    }

}
