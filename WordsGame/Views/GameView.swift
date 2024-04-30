//
//  GameView.swift
//  WordsGame
//
//  Created by Bit Bitin on 27.04.2024.
//

import SwiftUI

struct GameView: View {
    @State private var word = ""
    var viewModel: GameViewModel
    @Environment(\.dismiss) var dismiss
    @State private var confirmPresent = false
    @State private var isAlertPresent = false
    @State var alertText: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()
                } label: {
                    Text("exit")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color("ex"))
                        .cornerRadius(12)
                        .padding(6)
                        .foregroundColor(.purple)
                        .font(.custom("AvenirNext-Bold", size: 16))
            }
                Spacer()
            }
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(.white)
            HStack(spacing: 12) {
                VStack {
                    Text("\(viewModel.player1.score)")
                        .font(
                            .custom("AvenirNext-Bold",
                                      size: 60))
                        .foregroundColor(.white)
                    Text("\(viewModel.player1.name)")
                        .font(
                            .custom("AvenirNext-Bold",
                                      size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width/2.2, height: screen.width/2.2)
                    .background(Color("2nd"))
                    .cornerRadius(26)
                    .shadow(color: viewModel.isFirst ? .black : .clear, radius: 2, x: 0, y: 0)
                
                VStack {
                    Text("\(viewModel.player2.score)")
                        .font(
                            .custom("AvenirNext-Bold",
                                      size: 60))
                        .foregroundColor(.black)
                    Text("\(viewModel.player2.name)")
                        .font(
                            .custom("AvenirNext-Bold",
                                      size: 24))
                        .foregroundColor(.black)
                }.padding(20)
                    .frame(width: screen.width/2.2, height: screen.width/2.2)
                    .background(Color("1st"))
                    .cornerRadius(26)
                    .shadow(color: viewModel.isFirst ? .clear : .white, radius: 2, x: 0, y: 0)
            
            }
            
            WordTextField(word: $word, placeholder: "Ваше слово...")
                .padding(.horizontal)
            
            Button {
                var score = 0
                do {
                    try score = viewModel.check(word: word)
                }catch WordError.beforeWord {
                    alertText = "ПОВТОРЕНИЕ"
                    isAlertPresent.toggle()
                } catch WordError.litleWord {
                    alertText = "мало букв"
                    isAlertPresent.toggle()
                } catch WordError.theSameWord {
                    alertText = "не прокатит бро!"
                    isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = "букваръ посмотри"
                    isAlertPresent.toggle()

                } catch {
                    alertText = "idk, but error"
                    isAlertPresent.toggle()

                }
                
                if score > 1 {
                    self.word = ""
                }
            } label: {
                Text("Check")
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color(.black))
                    .font(.custom("AvenirNext-Bold",
                                  size: 18))
                    .cornerRadius(15)
                    .padding(.top, 30)
                    
                
            }
            
            List {
                ForEach(0 ..< self.viewModel.words.count, id: \.description){ item in
                    wordCell(word: self.viewModel.words[item], viewModel: self.viewModel)
                        .background(.clear)
                        .background(item % 2 == 0 ? Color("2nd") : Color("1st"))
                        .listRowInsets(EdgeInsets()) // границы
                        
                        
                }
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()

                
            
            
        }.background(Image("background"))
            .confirmationDialog("are you sure?",
                                isPresented: $confirmPresent,
                                titleVisibility: .visible) {
                Button(role: .destructive) {
                    self.dismiss()
                } label: {
                    Text("yep")
                }
                Button(role: .cancel) {
                    
                }label:{
                    Text("hell nah")
                    
                }
            }
            .alert(alertText,
                   isPresented: $isAlertPresent) {
                   Text("got chya")
            }

    }
}

#Preview {
    GameView(viewModel: GameViewModel(player1: Player(name: "Bidzho"),
                                      player2: Player(name: "Frederico"),
                                      word: "Малярия"))
}
