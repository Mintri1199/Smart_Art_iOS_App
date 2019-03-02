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
    var questionPhoto: UIImage?
    var listOfPhotos: [UIImage] = []
    var answerChosen: String = "" {
        didSet {
            print(answerChosen)
        }
    }
    var userAnswers: [String] = []
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
        // Add the target to call nextQuestion method
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func nextQuestion(userAnswer: String, photo: UIImage) {
        // find the viewController that house this button and make sure the variables are not nil
        guard let questionVC = findViewController() as? QuestionViewController else { return }
        guard let endOfQuiz = questionVC.endOfQuiz, let nextItemIndex = questionVC.nextItemIndex else { return }
        let finishVC = FinishViewController()
        // Record the user asnwers and photo so we don't have to download them again
        userAnswers.append(userAnswer)
        listOfPhotos.append(photo)
        if endOfQuiz {
            print("End of Quiz")
            finishVC.userAnswer = userAnswers
            finishVC.userResult = FinishQuiz(photos: listOfPhotos, correctAnswers: getAllCorrectAnswer(), userAnswers: userAnswers)
            questionVC.navigationController?.pushViewController(finishVC, animated: true)
        } else {
            questionVC.housingView.collectionView.scrollToItem(at: nextItemIndex, at: .left, animated: true)
            questionVC.housingView.buttonStack.reEnableButton()
            isHidden = true
        }
    }
    // This function will get call in preparation for push to the next screen
    private func getAllCorrectAnswer() -> [String] {
        var correctAnswers: [String] = []
        // Ref to the CV of the Viewcontroller to get the stored quiz object
        guard let questionVC = findViewController() as? QuestionViewController else { print("ill assign button, can not get all correct answer"); return []}
        let quiz = questionVC.housingView.collectionView.selectedQuiz
        // Loop through the questions array and append all the correct answer
        for question in quiz!.questions {
            correctAnswers.append(question.correct)
        }
        return correctAnswers
    }
    @objc private func buttonTapped() {
        print("next button tapped")
        nextQuestion(userAnswer: answerChosen, photo: questionPhoto!)
    }
}
