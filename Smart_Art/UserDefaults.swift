//
//  UserDefaults.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/4/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import Foundation

struct PersistenceLayer {
    private(set) var questions: [Question] = []
    private static let userDefaultQuestionKeyValue = "QUESTION_ARRAY"
    private var userName: String = ""
    private static let userDefaultUserNameKeyValue = "USERNAME_KEY"
    private var password: String = ""
    private static let userDefaultPasswordKeyValue = "PASSWORD_KEY"
}
