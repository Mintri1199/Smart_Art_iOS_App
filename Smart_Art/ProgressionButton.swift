//
//  ProgressionButton.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/26/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// This Custom button will take care of the progression of the quiz
class ProgressionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        backgroundColor = .toolBarColor
        isHidden = true
        setTitle("Next", for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel?.textAlignment = .center
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.textColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)  // Add the targt to call nextQuestion method
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func nextQuestion() {
        // find the viewController that house this button and make sure the variables are not nil
        guard let questionVC = findViewController() as? QuestionViewController else { return }
        guard let endOfQuiz = questionVC.endOfQuiz, let nextItemIndex = questionVC.nextItemIndex else { return }
        if endOfQuiz{
            print("End of Quiz")
            let finishVC = FinishViewController()
            questionVC.delegate = finishVC
            questionVC.navigationController?.pushViewController(finishVC, animated: true)
        } else {
            questionVC.housingView.cv.scrollToItem(at: nextItemIndex, at: .left, animated: true)
            questionVC.housingView.buttonStack.reEnableButton()
            isHidden = true
        }
    }
    
    @objc private func buttonTapped() {
        print("next button tapped")
        nextQuestion()
    }
    
}
