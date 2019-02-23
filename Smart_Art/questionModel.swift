//
//  questionModel.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/4/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import Foundation

// Question model
struct Question: Codable {
    let imgage: URL
    let correct: String
    let incorrect: [String]
}

// Quiz model
struct Quiz: Codable {
    let categories: [String]
    let questions: [Question]
}
