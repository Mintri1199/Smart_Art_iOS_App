//
//  FinishViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/26/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// This screen will show when the user is finish with the quiz
class FinishViewController: UIViewController {
    var userResult: FinishQuiz? {
        didSet {
            print(userResult)
            self.collectionView.reloadData()
        }
    }
    var userAnswer: [String]? {
        didSet {
            print("Passed user's answer: \(userAnswer)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        
        view.backgroundColor = .mainBackgroundColor
        print("Finished quiz")
        setupCollectionView()
        print("The userResult: \(userResult)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    func passData(result: FinishQuiz) {
        userResult = result
    }
    var collectionView = FinishCollectionView(frame: .zero, collectionViewLayout: FinishCVLayout())
    func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            ])
    }
}
