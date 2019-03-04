//
//  QuizSelectionCollectionView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/18/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Custom collectionView for selection screen
class QuizSelectionCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var quizzes:[Quiz]? {
        didSet {
            print("Received Quizzed from api")
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .mainBackgroundColor
        dataSource = self
        delegate = self
        translatesAutoresizingMaskIntoConstraints = false
        register(QuizSelectionCell.self, forCellWithReuseIdentifier: "quizCell")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let quizzes = quizzes else { print("Can't find quizzes"); return 0}
        return quizzes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as? QuizSelectionCell else { return UICollectionViewCell() }
        guard let quizzes = quizzes else { print("Can't find quizzes"); return UICollectionViewCell() }
        let quiz = quizzes[indexPath.row]
        cell.quizNameLabel.text = quiz.title
        getImage(urlString: (quiz.questions.randomElement()?.image)!) { (image) in
            DispatchQueue.main.async {
                cell.cellImageView.image = image
            }
        }
        // Set the drop shadow for the cell
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        cell.backgroundColor = .white
        return cell
    }
    // func that happen when the user tap on the cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Determine the viewController that this collectionView is in
        guard let quizScreen = self.findViewController() as? QuizViewController else { print("ill assign collectionView"); return }
        guard let quizzes = quizzes else {print("Can't find quizzes in select collectionView"); return }
        let questionVC = QuestionViewController()
        let selectedQuiz = quizzes[indexPath.row]
        questionVC.quizCellIndex = indexPath
        questionVC.housingView.collectionView.selectedQuiz = selectedQuiz
        //questionVC.housingView.collectionView.selectedQuiz = mockQuiz
        quizScreen.navigationController?.pushViewController(questionVC, animated: true)
    }
}
