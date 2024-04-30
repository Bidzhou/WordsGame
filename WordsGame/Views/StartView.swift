//
//  ContentView.swift
//  WordsGame
//
//  Created by Bit Bitin on 22.04.2024.
//

import SwiftUI

struct StartView: View {
    @State var bigWord = "" //модификатор свойства(обертка) state исп для одной 'вьюхи', cвойство состояния
    @State var player1 = ""
    @State var player2 = ""
    @State var isShowedGame: Bool = false
    @State var isAlertPresented = false
    var body: some View {
        VStack {
            TitleText(text: "WordsGame")                
            WordTextField(word: $bigWord, placeholder: "Введите длинное слово")
                .padding(20)
                .padding(.top, 32)
                .padding(.bottom,32)
            
            WordTextField(word: $player1, placeholder: "Игрок 1")
                .padding(.horizontal, 20)
                
            WordTextField(word: $player2, placeholder: "Игрок 2")
                .padding(.horizontal, 20)
                
            
            Button {
                if bigWord.count > 7{
                    isShowedGame.toggle()
                } else {
                    isAlertPresented.toggle()
                }
                
                
            } label: { //label - отрисовка кнопки
                Text("Start")
                .font(.custom("AvenirNext-Bold", size: 32))
                .foregroundColor(.black)
                
                .padding()
                .padding(.vertical, -10)
                .padding(.horizontal, 60)
                .background(.white)
                .cornerRadius(15)
                .padding(.top, 200)
            }

            
        }.background(Image("background"))
            .alert("Слишком короткое игровое слово", isPresented: $isAlertPresented, actions: {
                Text("got you")
            })
            .fullScreenCover(isPresented: $isShowedGame, content: {
                
                let name1 = player1 == "" ? "Игрок1" : player1
                let name2 = player2 == "" ? "Игрок2" : player2

                let player1 = Player(name: name1)
                let player2 = Player(name: name2)
                
                let gameViewModel = GameViewModel(player1: player1, player2: player2, word: bigWord)
                GameView(viewModel: gameViewModel)
            })
            
        
        
        
         
         
    }
}

#Preview {
    StartView()
}
//hi, this is my first commit)
