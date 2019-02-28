//
//  fourButtonStackView.swift
//  Smart_Art
//
//  Created by MattHew Phraxayavong on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Outer stackView of the four buttons
class fourButtonStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 50
        distribution = .fillEqually
        addArrangedSubview(firstButtonRow)
        addArrangedSubview(secondButtonRow)
        isLayoutMarginsRelativeArrangement = true
        translatesAutoresizingMaskIntoConstraints = false
        // Setting action for the buttons
        firstButtonRow.leftButton.addTarget(self, action: #selector(answerButtonPressRevised(_:)), for: .touchUpInside)
        firstButtonRow.rightButton.addTarget(self, action: #selector(answerButtonPressRevised(_:)), for: .touchUpInside)
        secondButtonRow.leftButton.addTarget(self, action: #selector(answerButtonPressRevised(_:)), for: .touchUpInside)
        secondButtonRow.rightButton.addTarget(self, action: #selector(answerButtonPressRevised(_:)), for: .touchUpInside)
        // Provide padding for spin animation since I can't use safeAreaLayoutGuide
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 18, leading: 0, bottom: 34, trailing: 0)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var firstButtonRow = buttonRowStackView()
    var secondButtonRow = buttonRowStackView()
    
    
    @objc func answerButtonPressRevised(_ sender: AnswerButton) {
        var endOfQuiz = false
        
        if let questionVC = findViewController() as? QuestionViewController {
            // Get the index of the current question cell
            let cellIndex = questionVC.housingView.cv.indexPathsForVisibleItems
            // Map the current cell index into the next
            guard let nextItemIndex = cellIndex.first.map({IndexPath(item: $0.row + 1, section: $0.section)}) else { return }
            // Check if the cell is the last cell in the collectionView
            if nextItemIndex[1] == mockQuiz.questions.count {
                questionVC.housingView.progressionButton.setTitle("Done", for: .normal)
                endOfQuiz = true
            }
            // Get the current question accordance to the cell's index
            let currentQuestion = mockQuiz.questions[cellIndex[0][1]]
            let answer = currentQuestion.correct
            // Check if the Button's titleLabel text is equal to the answer
            if sender.titleLabel?.text == answer {
                sender.rightAnswer()
                sender.rotate360Degrees()
                questionVC.housingView.progressionButton.isHidden = false
                questionVC.endOfQuiz = endOfQuiz
                questionVC.nextItemIndex = nextItemIndex
                questionVC.score += 1
                questionVC.housingView.scoreLabel.text = "Score: \(questionVC.score)"
                buttonsDisable()
                print("Correct Answer pressed")
            } else {
                sender.backgroundColor = .red                
                sender.shake()
                buttonsDisable()
                questionVC.housingView.progressionButton.isHidden = false
                questionVC.endOfQuiz = endOfQuiz
                questionVC.nextItemIndex = nextItemIndex
                print("Wrong Answer pressed")
            }
        }
    }
    
    // Disable all buttons once one is pressed
    private func buttonsDisable() {
        firstButtonRow.leftButton.isEnabled = false
        firstButtonRow.rightButton.isEnabled = false
        secondButtonRow.leftButton.isEnabled = false
        secondButtonRow.rightButton.isEnabled = false
    }
    
    // Re enable buttons after the cell moved
    func reEnableButton(){
        firstButtonRow.leftButton.isEnabled = true
        firstButtonRow.rightButton.isEnabled = true
        secondButtonRow.leftButton.isEnabled = true
        secondButtonRow.rightButton.isEnabled = true
        firstButtonRow.leftButton.backgroundColor = .toolBarColor
        firstButtonRow.rightButton.backgroundColor = .toolBarColor
        secondButtonRow.leftButton.backgroundColor = .toolBarColor
        secondButtonRow.rightButton.backgroundColor = .toolBarColor
    }
}
