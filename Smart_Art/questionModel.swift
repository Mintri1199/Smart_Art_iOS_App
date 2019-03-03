//
//  questionModel.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/4/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import Foundation
import UIKit

// Question model
struct Question: Codable {
    let image: String
    let question: String
    let correct: String
    let incorrect: [String]
    init(image: String, question: String, correct: String, incorrect: [String]) {
        self.image = image
        self.question = question
        self.correct = correct
        self.incorrect = incorrect
    }
}

// Quiz model
struct Quiz: Codable {
    let categories: [String]
    let questions: [Question]
    init(categories: [String], questions: [Question]) {
        self.categories = categories
        self.questions = questions
    }
}

// Finish Quiz Model
struct FinishQuiz {
    var photos: [UIImage]?
    var correctAnswers: [String]?
    var userAnswers: [String]?
    var score: Int
    let quizCellIndex: IndexPath
    init(photos: [UIImage], correctAnswers: [String], userAnswers: [String], index: IndexPath, score: Int) {
        self.photos = photos
        self.quizCellIndex = index
        self.score = score
        self.correctAnswers = correctAnswers
        self.userAnswers = userAnswers
    }
}
