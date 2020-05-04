//
//  Buttons.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-04.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import SwiftUI

//Generic button for Fields page and Backgrounds page
struct PrimaryButton: View {
    let descriptor: Descriptor
    let width: CGFloat
    let height: CGFloat
    var color: Image?
    let foregroundColor = Color.white
    var body: some View {
        NavigationLink(destination: PersonList(descriptor: descriptor)) {
            VStack {
                Spacer()
                Image(descriptor.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(foregroundColor)
                    .padding()
                Spacer()
                Text(descriptor.rawValue.capitalized)
                    .foregroundColor(foregroundColor)
                    .fontWeight(.semibold)
                    .padding()
                    .font(.custom(fontName, size: 19))
            }
            .frame(width: width, height: height)
        }
        .border(foregroundColor, width: 0.3)
        .background(color?.resizable())
    }
}

struct GameButton: View {
    let text: String
    let width: CGFloat
    let height: CGFloat
    var color: Image?
    let foregroundColor = Color.white
    let gameSession: GameSession
    var body: some View {
        Button(action: {
            if self.gameSession.validateAnswer(answer: self.text) {
                self.gameSession.correctAnswers += 1
            }
            self.gameSession.getNextQuestion()
            if !self.gameSession.checkGameOver() {
                self.gameSession.questionNumber += 1
            } else {
                self.gameSession.gameIsOver = true
            }
        }) {
            Text(text)
                .foregroundColor(foregroundColor)
                .fontWeight(.semibold)
                .padding()
                .font(.system(size: 23))
                .frame(width: width, height: height)
                .multilineTextAlignment(.center)
        }
        .border(foregroundColor, width: 0.3)
        .background(color?.resizable())
        .disabled(gameSession.gameIsOver)
    }
}
