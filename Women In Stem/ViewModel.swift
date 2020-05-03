//
//  ViewModel.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-02.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import Foundation
import SwiftUI


class GameSession: ObservableObject {
    @Published var currentQuestion = firstQuestion
    var iterator = questions.makeIterator()
    var questionsCompleted = 0
    var totalQuestions = questions.count + 1
    var correctAnswers = 0
    var questionNumber = 1
    var gameIsOver = false

    func validateAnswer(answer: String) -> Bool {
        return answer == currentQuestion.answer
    }

    func getNextQuestion() {
        currentQuestion = iterator.next() ?? congratulationMessage
    }
    
    func checkGameOver() -> Bool {
        if questionNumber == totalQuestions {
            return true
        }
        return false
    }
}


func getListValues(buttonType: Descriptor) -> [Person] {
    return people.filter { $0.descriptors.contains(buttonType) }
}
