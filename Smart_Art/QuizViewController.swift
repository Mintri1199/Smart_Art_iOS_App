//
//  QuizViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// This is where the user will select the quiz they want to play
class QuizViewController: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .mainBackgroundColor
        setupCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .toolBarColor
        //self.tabBarController?.tabBar.isHidden = false
    }

    func setupCollectionView() {
        let collectionView = QuizSelectionCollectionView(frame: .zero, collectionViewLayout: SelectionLayout())
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
}
