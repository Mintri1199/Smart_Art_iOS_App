//
//  ViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 1/31/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

protocol passUserResult {
    func passData(result: FinishQuiz)
}

class QuestionViewController: UIViewController {
    var score = 0
    var nextItemIndex: IndexPath?
    var endOfQuiz: Bool?
    var delegate: passUserResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .mainBackgroundColor
        setupHousingView()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        housingView.scoreLabel.text = "Score: \(score)"
    }
    
    // This custom view house all the components for this View Controller
    let housingView = QuestionGameHousingView()
    
    private func setupHousingView() {
        view.addSubview(housingView)
        NSLayoutConstraint.activate([
            housingView.topAnchor.constraint(equalTo: view.topAnchor),
            housingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            housingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            housingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
    
}


