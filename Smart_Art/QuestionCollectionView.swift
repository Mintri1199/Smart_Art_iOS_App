//
//  QuizCollectionView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class QuestionCollectionView: UICollectionView, UICollectionViewDataSource{
    // SelectedQuiz
    var selectedQuiz: Quiz?
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        isUserInteractionEnabled = false
        backgroundColor = .mainBackgroundColor
        bounces = false
        delegate = self
        dataSource = self
        register(QuestionCell.self, forCellWithReuseIdentifier: "QuizCell")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let quiz = selectedQuiz else { print("Can't find selected quiz"); return 0}
        return quiz.questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let quiz = selectedQuiz else { print("Can't find selected quiz"); return UICollectionViewCell()}
        let question = quiz.questions[indexPath.row]
        
        let cell = dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as! QuestionCell
        //cell.quizLabel.text = question.question
        getImage(urlString: question.image) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    cell.updateCell(with: image)
                }
            }
        }
        return cell
    }
}

extension QuestionCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let currentQuestion = mockQuiz.questions[indexPath.row]
        var currentOptions = currentQuestion.incorrect
        currentOptions.append(currentQuestion.correct)
        // Shuffle the array so the order of the options would be random
        currentOptions.shuffle()
        
        if let questionVC = findViewController() as? QuestionViewController {
            questionVC.housingView.buttonStack.firstButtonRow.leftButton.setTitle(currentOptions[0], for: .normal)
            questionVC.housingView.buttonStack.firstButtonRow.rightButton.setTitle(currentOptions[1], for: .normal)
            questionVC.housingView.buttonStack.secondButtonRow.leftButton.setTitle(currentOptions[2], for: .normal)
            questionVC.housingView.buttonStack.secondButtonRow.rightButton.setTitle(currentOptions[3], for: .normal)
        }
    }
}
