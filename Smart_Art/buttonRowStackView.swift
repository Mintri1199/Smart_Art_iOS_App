//
//  buttonStackView.swift
//  Smart_Art
//
//  Created by MattHew Phraxayavong on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Csustom horizontal stack of buttons
class ButtonRowStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        spacing = 30
        distribution = .fillEqually
        addArrangedSubview(rightButton)
        addArrangedSubview(leftButton)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var rightButton = AnswerButton(frame: .zero)
    var leftButton = AnswerButton(frame: .zero)
}
