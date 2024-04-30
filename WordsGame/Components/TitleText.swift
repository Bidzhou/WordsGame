//
//  TitleText.swift
//  WordsGame
//
//  Created by Bit Bitin on 27.04.2024.
//

import SwiftUI

struct TitleText: View {
    @State var text: String
    var body: some View {
        Text(text)
            .padding()
            .frame(maxWidth: .infinity)
            .cornerRadius(16)//скгругление формы
            .background(Color("FirstPlayer"))
            .font(.custom("AvenirNext-Bold", size: 38))
            .foregroundColor(.white)
    }
}

#Preview {
    TitleText(text: "магнитотерапия")
}
