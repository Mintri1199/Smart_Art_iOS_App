//
//  QuizViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .quizScreenColor
        setupCollectionView()
    }
    

    
    func setupCollectionView() {
        let collectionView = QuizSelectionCollectionView(frame: .zero, collectionViewLayout: SelectionLayout())
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        
    }
}
