//
//  ViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 1/31/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    func passData(quiz: QuizEntry.Quiz, index: Int) {
//        print(index)
//        if editing{
//            tableView.updateEntry(quiz: quiz, index: index)
//        } else {
//            tableView.addEntry(quiz: quiz)
//        }
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setupButtonStack()
    }
    
    var fourButtons = fourButtonStackView()
    
    
    func setupButtonStack() {
        view.addSubview(fourButtons)
        NSLayoutConstraint.activate([
            fourButtons.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            fourButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            fourButtons.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            fourButtons.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            ])
        
    }
}

