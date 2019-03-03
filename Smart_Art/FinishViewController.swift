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
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavbar()
        view.backgroundColor = .mainBackgroundColor
        print("Finished quiz")
        setupCollectionView()
        print("The userResult: \(userResult)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    private func configNavbar() {
        // Create a return button
        let returnButton = UIBarButtonItem(title: "RETURN", style: .done, target: self, action: #selector(returnButtonTapped))
        returnButton.tintColor = .white
        navigationItem.rightBarButtonItem = returnButton
        // Config the title of the NavBar
        let textAttribute = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        navigationItem.title =  "Score: \(userResult!.score)"
        navigationController?.navigationBar.titleTextAttributes = textAttribute
        // Show the navBar
        navigationController?.navigationBar.isHidden = false
    }
//    let returnButton: UIButton = {
//        var button = UIButton(frame: .zero)
//        button.setTitle("RETURN", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(returnButtonTapped), for: .touchUpInside)
//        return button
//    }()
    // Use Delegation to passed back score
    @objc func returnButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}
