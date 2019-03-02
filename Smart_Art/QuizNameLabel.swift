//
//  QuizNameLabel.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/18/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit
// Custom Label for quiz name in the selection screen
class QuizNameLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        numberOfLines = 3
        backgroundColor = .green
        text = "QUIZ NAME HERE"
        font = UIFont.systemFont(ofSize: 30)
        textAlignment = .center
        adjustsFontSizeToFitWidth = true    // Must the size to fit all the text
        minimumScaleFactor = 0.5            // Can not get small then the given percentage of the original text size
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Provide padding to the text
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        super.drawText(in: rect.inset(by: insets))
    }
}
