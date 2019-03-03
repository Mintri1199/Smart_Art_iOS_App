//
//  FinishCollectionView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/28/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Custom CollectionView that will be the main component for FinishVC
class FinishCollectionView: UICollectionView, UICollectionViewDataSource {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .mainBackgroundColor
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        register(FinishCVCell.self, forCellWithReuseIdentifier: "FinishCell")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let finishVC = findViewController() as? FinishViewController else { print("Ill assign Collection View"); return 0 }
        guard let result = finishVC.userResult?.correctAnswers!.count else { print("Can not read result object"); return 4 }
        return result
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let finishVC = self.findViewController() as? FinishViewController else { return UICollectionViewCell() }
        let cell = dequeueReusableCell(withReuseIdentifier: "FinishCell", for: indexPath) as? FinishCVCell
        let correctAnswer = finishVC.userResult?.correctAnswers![indexPath.row]
        let userAnswer = finishVC.userResult?.userAnswers![indexPath.row]
        
        cell?.labelsStack.correctAnswerLabel.text = "Correct: \(correctAnswer!)"
        cell?.labelsStack.userAnswerLabel.text = "You Answered: \(userAnswer!)"
        cell?.learnMoreButton.addTarget(self, action: #selector(learnMoreButtonTapped(sender:event:)), for: .touchUpInside)
        return cell!
    }
}

extension FinishCollectionView: UICollectionViewDelegate {
}

extension FinishCollectionView {
    @objc func learnMoreButtonTapped(sender: UIButton, event: UIEvent) {
        guard let finishVC = findViewController() as? FinishViewController else { return }
        let touch = event.allTouches!.first
        let currentTouchPosition: CGPoint = ((touch?.location(in: self))!)
        if let indexPath: NSIndexPath = self.indexPathForItem(at: currentTouchPosition)! as NSIndexPath {
            let cell = cellForItem(at: indexPath as IndexPath) as! FinishCVCell
            
            let artist = finishVC.userResult?.correctAnswers![indexPath.row]
            print(artist)
        }else {
            return
        }
    }
}
