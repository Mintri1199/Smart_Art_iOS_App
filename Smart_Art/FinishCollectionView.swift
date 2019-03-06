//
//  FinishCollectionView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/28/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit
import SafariServices

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
        let artwork = finishVC.userResult?.photos![indexPath.row]
        cell?.imageView.image = artwork
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
        print("Button Tapped")
        // Ref to the finishVC
        guard let finishVC = findViewController() as? FinishViewController else { return }
        // Observe the user touch
        let touch = event.allTouches!.first
        // Find where did the user touched
        let currentTouchPosition: CGPoint = ((touch?.location(in: self))!)
        // Get the index of the cell that the user touched
        if let indexPath = self.indexPathForItem(at: currentTouchPosition) as NSIndexPath? {
            // Index the correct artist of hte quiz
            var artist = finishVC.userResult?.correctAnswers![indexPath.row]
            // Format the artist name into url compatible
            artist = artist?.replacingOccurrences(of: " ", with: "_")
            artist = artist?.replacingOccurrences(of: "-", with: "_")
            print(artist)
            // Checking if the url is valid
            if let wikiUrl = URL(string: "\(finishVC.url)\(artist!)") {
                // Instanciate a Safari view controller
                let safariVC = SFSafariViewController(url: wikiUrl, entersReaderIfAvailable: true)
                // Assign the safariVC to finishVC
                safariVC.delegate = finishVC.self
                // Present the safari view controller
                finishVC.present(safariVC, animated: true, completion: nil)
            }} else {
            return
        }
    }
}
