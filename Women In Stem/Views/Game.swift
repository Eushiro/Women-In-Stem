//
//  Game.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-04.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import SwiftUI

//Games view
struct GamesView: View {
    let buttonSpacing = CGFloat(0.1)
    let backgroundColor = Image("waterBlue")
    @ObservedObject var game = GameSession()
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: self.buttonSpacing) {
                    Divider()
                    HStack {
                        Text("Score: " + String(self.game.correctAnswers))
                            .padding()
                            .font(.custom(fontName, size: 20))
                        Spacer()
                        Text("Question: " + String(self.game.questionNumber) + "/" + String(self.game.totalQuestions))
                            .padding()
                            .font(.custom(fontName, size: 20))
                    }
                    Spacer()
                    Text(self.game.currentQuestion.question)
                        .padding()
                        .font(.custom(fontName, size: 25))
                        .multilineTextAlignment(.center)
                    if self.game.gameIsOver {
                        Button(action: {
                            self.game.resetGame()
                        }) {
                            Text("Play Again")
                                .font(.system(size: 25))
                        }
                    }
                    Spacer()
                    HStack(spacing: self.buttonSpacing) {
                        GameButton(text: self.game.currentOptions[0], width: geometry.size.width/2, height: geometry.size.width/2, color: self.backgroundColor, gameSession: self.game)
                        
                        GameButton(text: self.game.currentOptions[1], width: geometry.size.width/2, height: geometry.size.width/2, color: self.backgroundColor, gameSession: self.game)
                    }
                    
                    HStack(spacing: self.buttonSpacing) {
                        GameButton(text: self.game.currentOptions[2], width: geometry.size.width/2, height: geometry.size.width/2, color: self.backgroundColor, gameSession: self.game)
                        
                        GameButton(text: self.game.currentOptions[3], width: geometry.size.width/2, height: geometry.size.width/2, color: self.backgroundColor, gameSession: self.game)
                    }
                }
                .navigationBarTitle("Trivia")
            }
        }
    }
}
