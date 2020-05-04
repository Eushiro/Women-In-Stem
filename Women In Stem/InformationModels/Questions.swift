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
    var options: [String]?
    init(question: String, answer: String, options: [String]) {
        self.question = question
        self.answer = answer
        self.options = options
    }
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
    
    static func generateOptions(question: Question) -> [String] {
        if question.options != nil {
            return question.options ?? ["", "", "", ""]
        }
        
        var options = [question.answer, people.randomElement()?.name ?? "", people.randomElement()?.name ?? "", people.randomElement()?.name ?? ""]
        while Set(options).count != 4 {
            options = [question.answer, people.randomElement()?.name ?? "", people.randomElement()?.name ?? "", people.randomElement()?.name ?? ""]
        }
        return options.shuffled()
    }
}

let congratulationMessage = Question(question: "Congratulations! You've finished the game.", answer: "", options: ["", "", "", ""])

var questions = [
    Question(question: "Who worked on the Manhattan project and worked on beta decay?", answer: "Chien-Shiung Wu"),
    Question(question: "Who immigrated from China to the United States to complete her PhD?", answer: "Chien-Shiung Wu"),
    Question(question: "Who was the first Indigenous woman to obtain a full time position at the United States Census Bureau?", answer: "Edna Paisano"),
    Question(question: "Who helped improve the accuracy of the United States census?", answer: "Edna Paisano"),
    Question(question: "Who was part of a team known as Skunk Works?", answer: "Mary G. Ross"),
    Question(question: "Who helped write NASA’s Planetary Flight Handbook?", answer: "Mary G. Ross"),
    Question(question: "Who was able to attend Hunter College for free due to her good grades?", answer: "Gertrude B. Elion"),
    Question(question: "Who won a Nobel Prize for designing a drug that could interfere with cell growth?", answer: "Gertrude B. Elion"),
    Question(question: "Who won a Nobel Prize for a theory that explains how energy moves in the body?", answer: "Gerty Cori"),
    Question(question: "Who helped explain the cycle of carbohydrates in the human body?", answer: "Gerty Cori"),
    Question(question: "Who built a laboratory in her bedroom after fleeing from Germany?", answer: "Rita Levi-Montalcini"),
    Question(question: "Who won a Nobel prize for discovering the nerve-growth factor?", answer: "Rita Levi-Montalcini"),
    Question(question: "Who was one of only five women to enrol in medical courses at Hyderabad Medical College?", answer: "Rupa Bai Furdoonji"),
    Question(question: "Who needed an Urdu translator to complete her medical school lectures?", answer: "Rupa Bai Furdoonji"),
    Question(question: "Who graduated with a thesis entitled \"Obstetrics among the Aryan Hindoos”?", answer: "Anandi Gopal Joshi"),
    Question(question: "Who was congratulated by Queen Victoria following her graduation?", answer: "Anandi Gopal Joshi"),
    Question(question: "Whose thesis established hydrogen as the most abundant element in the universe?", answer: "Cecilia Helena Payne"),
    Question(question: "Who received the first Ph.D. in astronomy from Radcliffe College?", answer: "Cecilia Helena Payne"),
    Question(question: "Who became almost completely deaf, likely due to a case of scarlet fever?", answer: "Annie Jump Cannon"),
    Question(question: "Who created a new system for classifying stars that became a new universal standard?", answer: "Annie Jump Cannon"),
    Question(question: "Who learned French in order to apply to flying schools in France?", answer: "Bessie Coleman"),
    Question(question: "Who refused to speak at any events or locations that were segregated or that discriminated against African Americans?", answer: "Bessie Coleman"),
    Question(question: "Who pioneered the discovery of the relationship between high cholesterol and clogged arteries?", answer: "Marie Maynard Daly"),
    Question(question: "Who supported efforts to enrol minority students in medical schools and graduate science programs?", answer: "Marie Maynard Daly"),
    Question(question: "Who worked as an aeronautical engineer at NASA?", answer: "Mary Jackson"),
    Question(question: "Who became Langley’s Federal Women’s Program Manager in order to make an important impact on the hiring of the next generation of NASA’s female scientists?", answer: "Mary Jackson"),
    Question(question: "Who stated that she would rather face the maximum penalty than to live with her husband and stop her education?", answer: "Rukhmabai"),
    Question(question: "Who wrote to Queen Victoria to dissolve her marriage?", answer: "Rukhmabai"),
    Question(question: "Who has traveled to Argentina, Chile, Mount McKinley, Brazil, Ecuador, Peru and the Straits of Magellan, and southwestern Mexico?", answer: "Ynes Mexia"),
    Question(question: "Who contributed to the finding of many new species among her 150,000 total plant samples?", answer: "Ynes Mexia"),
    Question(question: "Whose father, brother and sister were relocated following the attack on Pearl Harbour?", answer: "Ruby Hirose"),
    Question(question: "Who conducted research on hay fever while suffering from hay fever herself?", answer: "Ruby Hirose"),
    Question(question: "Who sold fossils to collectors and scholars to sustain her family?", answer: "Mary Anning"),
    Question(question: "Who discovered the first intact Plesiosaurus skeleton?", answer: "Mary Anning"),
    Question(question: "Who taught herself French in order to obtain a medical degree from the University of Paris?", answer: "Elizabeth Garrett Anderson"),
    Question(question: "Who helped found the London School of Medicine for Women?", answer: "Elizabeth Garrett Anderson"),
    Question(question: "Who won a Nobel Prize for solving the atomic structure of important molecules such as penicillin and insulin using X-ray crystallography?", answer: "Dorothy Hodgkin"),
    Question(question: "Who continued her research undeterred despite her worsening arthritis?", answer: "Dorothy Hodgkin"),
    Question(question: "Who was one of just three women certified to teach physics at a German university before World War II?", answer: "Hedwig Kohn"),
    Question(question: "Who was forced to move from Germany to America during World War II due to her Jewish ancestry?", answer: "Hedwig Kohn")
].shuffled()
