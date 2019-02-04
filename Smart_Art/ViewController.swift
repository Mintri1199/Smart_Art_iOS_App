//
//  ViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 1/31/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        setupButtonStack()
        setupCollectionView()
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
            cv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cv.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -30),
            cv.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
    }
    
}

