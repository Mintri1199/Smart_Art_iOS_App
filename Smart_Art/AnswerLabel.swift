//
//  AnswerLabel.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/28/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// This Custom UILabel will act as a label for the user answer and the correct answer
class AnswerLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
        textAlignment = .left
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        super.drawText(in: rect.inset(by: insets))
    }
}
