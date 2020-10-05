//
//  GameModel.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-02.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import Foundation
import SwiftUI

class GameSession: ObservableObject {
    @Published var currentQuestion = questions[0] {
        didSet {
            currentOptions = currentQuestion.generateOptions(question: currentQuestion)
        }
    }
    lazy var currentOptions = currentQuestion.generateOptions(question: questions[0])
    var iterator = questions.makeIterator()
    var questionsCompleted = 0
    var totalQuestions = 10
    var correctAnswers = 0
    var questionNumber = 1
    var gameIsOver = false
    lazy var highscore = getHighscore()

    func validateAnswer(answer: String) -> Bool {
        return answer == currentQuestion.answer
    }

    func getNextQuestion() {
        currentQuestion = !checkGameOver() ? iterator.next() ?? congratulationMessage : congratulationMessage
    }
    
    func checkGameOver() -> Bool {
        return questionNumber == totalQuestions
    }
    
    func resetGame() {
        highscore = max(highscore, correctAnswers)
        saveHighscore()
        correctAnswers = 0
        questionNumber = 1
        gameIsOver = false
        questions = questions.shuffled()
        iterator = questions.makeIterator()
        getNextQuestion()
    }
    
    func saveHighscore() {
        let highScoreKey = "highScoreKey"
        let defaults = UserDefaults.standard
        defaults.set(max(highscore, correctAnswers), forKey: highScoreKey)
    }
    
    func getHighscore() -> Int {
        let highScoreKey = "highScoreKey"
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: highScoreKey)
    }
}
