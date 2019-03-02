//
//  QuestionGameHousingView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/26/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// This view will house all the UI components related to the QuestionVC
class QuestionGameHousingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainBackgroundColor
        autoresizesSubviews = true
        translatesAutoresizingMaskIntoConstraints = false
        setupScoreLabel()
        setupProgressionButton()
        setupButtonStack()
        setupCollectionView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Screen size instance created to use as reference for scoreLabel and progressionButton
    // Why I do this? I can't reference the UIView bounds or frame since they will start out as zero. Plus I'm not giving it a frame
    var screenSize = UIScreen.main.bounds
    // Custom UIs
    var buttonStack = FourButtonStackView(frame: .zero)
    var collectionView = QuestionCollectionView(frame: .zero, collectionViewLayout: QuizLayout())
    var scoreLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    var progressionButton = ProgressionButton()
    private func setupButtonStack() {
    addSubview(buttonStack)
        NSLayoutConstraint.activate([
            buttonStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
            ])
    }
    private func setupCollectionView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -30),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    private func setupScoreLabel() {
        addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: topAnchor, constant: 44),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            scoreLabel.heightAnchor.constraint(equalToConstant: screenSize.height/15),
            scoreLabel.widthAnchor.constraint(equalToConstant: screenSize.width/2)
            ])
    }
    private func setupProgressionButton() {
        addSubview(progressionButton)
        NSLayoutConstraint.activate([
            progressionButton.topAnchor.constraint(equalTo: scoreLabel.topAnchor, constant: 5),
            progressionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            progressionButton.bottomAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: -5),
            progressionButton.widthAnchor.constraint(equalToConstant: screenSize.width/4)
            ])
    }
}
