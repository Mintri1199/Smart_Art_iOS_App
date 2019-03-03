//
//  InnerStackView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 3/2/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// This Custom function contains one placeholder label and answer label for finishVC
class InnerStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        spacing = 5
        alignment = .center
        distribution = .fill
        addArrangedSubview(placeholder)
        addArrangedSubview(answerLabel)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var placeholder = PlaceholderLabel(frame: .zero)
    var answerLabel = AnswerLabel(frame: .zero)
}
