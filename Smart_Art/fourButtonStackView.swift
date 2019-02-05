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
        firstButtonRow.leftButton.tag = 1
        
        firstButtonRow.rightButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        firstButtonRow.rightButton.tag = 2
        
        secondButtonRow.leftButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        secondButtonRow.leftButton.tag = 3
        
        secondButtonRow.rightButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        secondButtonRow.rightButton.tag = 4
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var firstButtonRow = buttonRowStackView()
    var secondButtonRow = buttonRowStackView()
    
    // Holy shit find a better way to do this
    @objc func answerButtonTapped(_ sender: AnswerButton) {
        var endOfQuiz = false
        
        if let quizVC = findViewController() as? ViewController {
            // Get the index of current question cell
            let index = quizVC.cv.indexPathsForVisibleItems
            // Get the index of next
            guard let nextItemIndex = index.first.map({IndexPath(item: $0.row + 1, section: $0.section)}) else { return }
            // Creating a dictionary to pass it into the timer selector
            let nextIndex = ["index" : nextItemIndex]
            // Check if the cell is the last cell in the collectionView
            if nextItemIndex[1] == mockQuestions.count{
                endOfQuiz = true
            }
            
            let answer = mockQuestions[index[0][1]][1]     // Holy shit what the fuck, Change this once the question model has been created
            if sender.titleLabel?.text == answer{
                sender.backgroundColor = .green
                quizVC.score += 1
                quizVC.scoreLabel.text = "Score: \(quizVC.score)"
                disableButtons(button: sender)
                if endOfQuiz{
                    print("End of quiz")
                } else{
                    print("Correct Answer pressed")
                    Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(delayTransition(timer:)), userInfo: nextIndex, repeats: false)
                }
                
            }else{
                sender.backgroundColor = .red
                if endOfQuiz{
                    print("End of quiz")
                } else{
                    print("Wrong Answer pressed")
                    disableButtons(button: sender)
                    Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(delayTransition(timer:)), userInfo: nextIndex, repeats: false)
                }
            }
        }
    }
    
    @objc func delayTransition(timer: Timer){
        guard let context = timer.userInfo as? [String : IndexPath] else { return }
        let index = context["index", default: IndexPath(row: 0, section: 0)]
        
        if let quizVC = findViewController() as? ViewController {
            quizVC.cv.scrollToItem(at: index, at: .left, animated: true)
            reEnableButton()
        }
    }
    
    
    // Disable other buttons once one is pressed
    func disableButtons(button: AnswerButton) {
        switch button.tag {
        case 1:
            firstButtonRow.rightButton.isEnabled = false
            secondButtonRow.leftButton.isEnabled = false
            secondButtonRow.rightButton.isEnabled = false
        case 2:
            firstButtonRow.leftButton.isEnabled = false
            secondButtonRow.leftButton.isEnabled = false
            secondButtonRow.rightButton.isEnabled = false
        case 3:
            firstButtonRow.rightButton.isEnabled = false
            firstButtonRow.leftButton.isEnabled = false
            secondButtonRow.rightButton.isEnabled = false
        case 4:
            firstButtonRow.rightButton.isEnabled = false
            firstButtonRow.leftButton.isEnabled = false
            secondButtonRow.leftButton.isEnabled = false
            
        default:
            print("Error at switch statement")
        }
        // Prevent the correct button to be pressed more
        button.isEnabled = false
    }
    
    // Re enable buttons after the cell move
    func reEnableButton(){
        firstButtonRow.leftButton.isEnabled = true
        firstButtonRow.rightButton.isEnabled = true
        secondButtonRow.leftButton.isEnabled = true
        secondButtonRow.rightButton.isEnabled = true
        firstButtonRow.leftButton.backgroundColor = .purple
        firstButtonRow.rightButton.backgroundColor = .purple
        secondButtonRow.leftButton.backgroundColor = .purple
        secondButtonRow.rightButton.backgroundColor = .purple
    }
}
