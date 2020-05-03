//
//  Questions.swift
//  Women In Stem
//
//  Created by Hiro Ayettey on 2020-05-03.
//  Copyright © 2020 Hiro Ayettey. All rights reserved.
//

import Foundation

class Question {
    var question: String
    var answer: String
    var options: [String]
    init(question: String, answer: String, options: [String]) {
        self.question = question
        self.answer = answer
        self.options = options
    }
}

//The first question to be shown
let firstQuestion = Question(question: "First: What is your name?", answer: "Hiro", options: ["Hiro", "Mo", "Z", "F"])
let congratulationMessage = Question(question: "Congratulations! You've finished the game.", answer: "Hiro", options: ["", "", "", ""])

let questions = [
    Question(question: "What is your name?", answer: "Hiro", options: ["Hiro", "Mo", "Z", "F"]),
    Question(question: "What is not your name?", answer: "Mo", options: ["Hiro", "Mo", "Z", "F"])
]
