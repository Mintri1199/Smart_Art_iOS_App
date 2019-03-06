//
//  QuizSelectionCell.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/18/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Custom cell for collectionView in selection screen
class QuizSelectionCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 30
        setupImageView()
        setupQuizNameLabel()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Custom UI components for the cell
    var cellImageView = CellImageView(frame: .zero)
    var quizNameLabel = QuizNameLabel(frame: .zero)
    var quizScoreLabel = QuizScoreLabel(frame: .zero)
    // Functions to add constraints to custom UI components
    func setupImageView() {
        addSubview(cellImageView)
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
            ])
    }
    func setupQuizNameLabel() {
        addSubview(quizNameLabel)
        NSLayoutConstraint.activate([
            quizNameLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor),
            quizNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            quizNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            quizNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
            ])
    }
    // Not currently use
    func setupQuizScoreLabel() {
        addSubview(quizScoreLabel)
        NSLayoutConstraint.activate([
            quizScoreLabel.topAnchor.constraint(equalTo: quizNameLabel.bottomAnchor),
            quizScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            quizScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            quizScoreLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
