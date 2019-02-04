//
//  QuestionVCViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 1/31/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class QuestionVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        navigationController?.navigationBar.isHidden = true
        setupCV()
        
    }
    
    var cv = QuestionCV(frame: .zero, collectionViewLayout: CustomLayout())
    
    private func setupCV() {
        view.addSubview(cv)
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cv.heightAnchor.constraint(equalToConstant: view.bounds.height/2),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ])
        
        
    }

}
