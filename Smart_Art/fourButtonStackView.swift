//
//  fourButtonStackView.swift
//  Smart_Art
//
//  Created by MattHew Phraxayavong on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class fourButtonStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 50
        distribution = .fillEqually
        addArrangedSubview(firstButtonRow)
        addArrangedSubview(secondButtonRow)
        translatesAutoresizingMaskIntoConstraints = false
        
        firstButtonRow.leftButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        firstButtonRow.rightButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        secondButtonRow.leftButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        secondButtonRow.rightButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var firstButtonRow = buttonRowStackView()
    var secondButtonRow = buttonRowStackView()
    
    // Holy shit find a better way to do this
    @objc func answerButtonTapped(_ sender: AnswerButton) {
        if let quizVC = findViewController() as? ViewController {
            let index = quizVC.cv.indexPathsForVisibleItems
            let answer = mockQuestions[index[0][1]][1]     // Holy shit what the fuck
            if sender.titleLabel?.text == answer{
                sender.backgroundColor = .green
                sender.titleLabel?.textColor = .black
                quizVC.score += 1
                quizVC.scoreLabel.text = "Score: \(quizVC.score)"
            }else{
                sender.backgroundColor = .red
            }
        }
    }
}
