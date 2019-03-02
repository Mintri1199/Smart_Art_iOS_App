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
    init(photos: [UIImage], correctAnswers: [String], userAnswers: [String]) {
        self.photos = photos
        self.correctAnswers = correctAnswers
        self.userAnswers = userAnswers
    }
}
