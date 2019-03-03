//
//  FinishViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/26/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit
import SafariServices

// This screen will show when the user is finish with the quiz
class FinishViewController: UIViewController, SFSafariViewControllerDelegate {
    let url = "https://en.wikipedia.org/wiki/"
    var userResult: FinishQuiz? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavbar()
        view.backgroundColor = .mainBackgroundColor
        print("Finished quiz")
        setupCollectionView()
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
        // Get rid of the back button
        navigationItem.hidesBackButton = true
        // Show the navBar
        navigationController?.navigationBar.isHidden = false
    }
    // Use Delegation to passed back score later and figure out how to do persistence
    @objc func returnButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
}
