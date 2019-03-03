//
//  OuterLabelStackView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 3/2/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// This Custom UI will contains two innerlabelStackView. One for user answer and correct answer.
class OuterLabelStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 2
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(userAnswerLabel)
        addArrangedSubview(correctAnswerLabel)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var userAnswerLabel: AnswerLabel = {
        var label = AnswerLabel(frame: .zero)
        label.text = "Your Answer: Whatever"
        return label
    }()
    
    var correctAnswerLabel: AnswerLabel = {
        var label = AnswerLabel(frame: .zero)
        label.text = "Correct: Correct Answer"
        return label
    }()

}
