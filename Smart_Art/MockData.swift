//
//  MockData.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import Foundation

let firstQuestion = Question.init(image: "None", question: "What art movement was Yoko Ono associated with during the 1960s?", correct: "FLUXUS", incorrect: ["DADAISM","FUTURISM","POST-IMPRESSIONALISM"])

let secondQuestion = Question.init(image: "None", question: "Who was the court sculptor of Alexander the Great?", correct: "LYSIPPUS", incorrect: ["VIRTUVIUS", "APELLES", "PRAXITELES"])

let mockQuiz = Quiz.init(categories: ["Mock"], questions: [firstQuestion, secondQuestion])
