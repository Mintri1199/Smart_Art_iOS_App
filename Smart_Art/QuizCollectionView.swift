//
//  QuizCollectionView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class QuizCollectionView: UICollectionView, UICollectionViewDataSource{
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        isUserInteractionEnabled = false
        bounces = false
        delegate = self
        dataSource = self
        register(QuestionCell.self, forCellWithReuseIdentifier: "QuizCell")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockQuiz.questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let question = mockQuiz.questions[indexPath.row]
        
        let cell = dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as! QuestionCell
        cell.quizLabel.text = question.question
        getImage(urlString: question.image) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    cell.imageView.image = image
                }
            }
        }
        return cell
    }
    
}

extension QuizCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let currentQuestion = mockQuiz.questions[indexPath.row]
        var currentOptions = currentQuestion.incorrect
        currentOptions.append(currentQuestion.correct)
        
        currentOptions.shuffle()
        
        if let quizVC = findViewController() as? QuestionViewController {
            quizVC.buttonStack.firstButtonRow.leftButton.setTitle(currentOptions[0], for: .normal)
            quizVC.buttonStack.firstButtonRow.rightButton.setTitle(currentOptions[1], for: .normal)
            quizVC.buttonStack.secondButtonRow.leftButton.setTitle(currentOptions[2], for: .normal)
            quizVC.buttonStack.secondButtonRow.rightButton.setTitle(currentOptions[3], for: .normal)
        }
    }
}
