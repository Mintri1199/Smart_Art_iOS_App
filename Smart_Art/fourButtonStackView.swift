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
        backgroundColor = .green
        distribution = .fillEqually
        addArrangedSubview(firstButtonRow)
        addArrangedSubview(secondButtonRow)
        translatesAutoresizingMaskIntoConstraints = false
        firstButtonRow.leftButton.addTarget(self, action: #selector(answerButtonPressRevised(_:)), for: .touchUpInside)
        firstButtonRow.rightButton.addTarget(self, action: #selector(answerButtonPressRevised(_:)), for: .touchUpInside)
        secondButtonRow.leftButton.addTarget(self, action: #selector(answerButtonPressRevised(_:)), for: .touchUpInside)
        secondButtonRow.rightButton.addTarget(self, action: #selector(answerButtonPressRevised(_:)), for: .touchUpInside)
        
        firstButtonRow.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var firstButtonRow = buttonRowStackView()
    var secondButtonRow = buttonRowStackView()
    
    
    
    @objc func answerButtonPressRevised(_ sender: AnswerButton) {
        var endOfQuiz = false
        
        if let questionVC = findViewController() as? QuestionViewController {
            // Get the index of hte current question cell
            let cellIndex = questionVC.cv.indexPathsForVisibleItems
            // Get the index of next
            guard let nextItemIndex = cellIndex.first.map({IndexPath(item: $0.row + 1, section: $0.section)}) else { return }
            // Creating a dictionary to pass it into the timer selector
            let nextIndex = ["index": nextItemIndex]
            // Check if the cell is the last cell int he collectionView
            if nextItemIndex[1] == mockQuiz.questions.count {
                endOfQuiz = true
            }
            
            // Get the current question accordance to the cell's index
            let currentQuestion = mockQuiz.questions[cellIndex[0][1]]
            let answer = currentQuestion.correct
            
            if sender.titleLabel?.text == answer {
                sender.rightAnswer()
                sender.rotate360Degrees()
                questionVC.score += 1
                questionVC.scoreLabel.text = "Score: \(questionVC.score)"
                buttonsDisable()
                if endOfQuiz{
                    print("End of quiz")
                } else{
                    print("Correct Answer pressed")
                    Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(delayTransition(timer:)), userInfo: nextIndex, repeats: false)
                }
            } else {
                sender.backgroundColor = .red                
                sender.shake()
                buttonsDisable()
                if endOfQuiz{
                    print("End of quiz")
                } else{
                    print("Wrong Answer pressed")
                    Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(delayTransition(timer:)), userInfo: nextIndex, repeats: false)
                }
            }
        }
    }
    
    // Timer function after the interval
    @objc func delayTransition(timer: Timer){
        // Since you can't pass argument in a selector, you have to utilizes useInfo to handle passing arguments
        // Guard type cast userInfo because it is Any? by default
        guard let context = timer.userInfo as? [String : IndexPath] else { return }
        // Then access the element you want
        let index = context["index", default: IndexPath(row: 0, section: 0)]
        
        if let quizVC = findViewController() as? QuestionViewController  {
            quizVC.cv.scrollToItem(at: index, at: .left, animated: true)
            reEnableButton()
        }
    }
    
    // Disable all buttons once one is pressed
    func buttonsDisable() {
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
