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
        register(QuizCell.self, forCellWithReuseIdentifier: "QuizCell")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockQuestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as! QuizCell
        cell.quizLabel.text = mockQuestions[indexPath.row][0]
        
        return cell
    }
    
}

extension QuizCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let quizVC = findViewController() as? ViewController {
            quizVC.buttonStack.firstButtonRow.leftButton.setTitle(mockAnswerOptions[indexPath.row][0], for: .normal)
            quizVC.buttonStack.firstButtonRow.rightButton.setTitle(mockAnswerOptions[indexPath.row][1], for: .normal)
            quizVC.buttonStack.secondButtonRow.leftButton.setTitle(mockAnswerOptions[indexPath.row][2], for: .normal)
            quizVC.buttonStack.secondButtonRow.rightButton.setTitle(mockAnswerOptions[indexPath.row][3], for: .normal)
        }
    }
}
