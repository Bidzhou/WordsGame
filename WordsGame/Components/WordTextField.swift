//
//  WordTextField.swift
//  WordsGame
//
//  Created by Bit Bitin on 27.04.2024.
//

import SwiftUI

struct WordTextField: View {
    @State var word: Binding<String>
    var placeholder: String
    var body: some View {
        
        TextField(placeholder, text: word)//dollar sign означает binding что в свою очередь означает отслеживание
            
            .font(.title2)
            .padding()//по умолчанию (.all, 16)
            .background(.white)
            .cornerRadius(15)
    }
}

			
