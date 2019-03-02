//
//  QuizLabel.swift
//  Smart_Art
//
//  Created by MattHew Phraxayavong on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Custom label for question (not in use currently)
class QuestionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        numberOfLines = 10
        backgroundColor = UIColor(red:0.24, green:0.25, blue:0.37, alpha:1.0) //.quizLabelColor
        layer.cornerRadius = 30
        text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        textColor = .white
        font = UIFont.boldSystemFont(ofSize: 30)
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Provide padding to the text
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        super.drawText(in: rect.inset(by: insets))
    }
}
