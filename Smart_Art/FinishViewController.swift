//
//  FinishViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/26/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit


// This screen will show when the user is finish with the quiz
class FinishViewController: UIViewController, passUserResult {
    var userResult: FinishQuiz?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackgroundColor
        print("Finished quiz")
        
        setupCollectionView()
    }

    func passData(result: FinishQuiz) {
        userResult = result
    }
    
    var cv = FinishCollectionView(frame: .zero, collectionViewLayout: FinishCVLayout())
    
    func setupCollectionView() {
        view.addSubview(cv)
        
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            ])
        
    }
    
}
