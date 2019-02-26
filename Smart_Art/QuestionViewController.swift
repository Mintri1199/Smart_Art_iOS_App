//
//  ViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 1/31/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .mainBackgroundColor
        setupScoreLabel()
        setupButtonStack()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        scoreLabel.text = "Score: \(score)"
    }
    
    var buttonStack = fourButtonStackView(frame: .zero)
    var cv = QuizCollectionView(frame: .zero, collectionViewLayout: QuizLayout())
    
    func setupButtonStack() {
        view.addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            buttonStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            ])
    }
    
    func setupCollectionView() {
        view.addSubview(cv)
        
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cv.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -30),
            cv.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
    }
    
    var scoreLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .mainBackgroundColor
        return label
    }()
    
    private func setupScoreLabel() {
        view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            scoreLabel.heightAnchor.constraint(equalToConstant: view.bounds.height/15),
            scoreLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2)
            ])
    }
    
    
}


