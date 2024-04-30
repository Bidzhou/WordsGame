//
//  wordCell.swift
//  WordsGame
//
//  Created by Bit Bitin on 30.04.2024.
//

import SwiftUI

struct wordCell: View {
    let word: String
    var viewModel: GameViewModel
    var body: some View {
        HStack{
            Text(word)
                .foregroundColor(viewModel.isFirst ? .black: .white)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .leading)
                .padding()
                .font(.custom("AvenirNext-Bold", size: 22))
            Text("\(word.count)")
                .foregroundColor(viewModel.isFirst ? .black: .white)
                .padding()
                .font(.custom("AvenirNext-Bold", size: 22))
        }
    }
}

#Preview {
    wordCell(word: "магнит",viewModel: GameViewModel(player1: Player(name:"Bidzho"),
                                                     player2:Player(name:"Frederico"),
                                                     word: "Малярия"))
}
