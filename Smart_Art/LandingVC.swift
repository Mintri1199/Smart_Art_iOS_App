//
//  LandingVC.swift
//  Smart_Art
//
//  Created by Jackson Ho on 3/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LandingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .toolBarColor
        getQuizzes()
        setupIcon()
        setupActivityIndicator()
        setupWelcomeLabel()
        activityIndicator.startAnimating()
    }
    private var imageView: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.image = UIImage(named: "icon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var activityIndicator: NVActivityIndicatorView = {
        var indicator = NVActivityIndicatorView(frame: .zero, type: .ballTrianglePath, color: .white, padding: 0)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    private var welcomeLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Welcome to Smart Art\n\n Please wait for quizzes to load"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 5
        label.backgroundColor = .toolBarColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private func setupIcon() {
        // This function add an ImageView in the center of the screen
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height/6),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
            ])
    }
    private func setupActivityIndicator() {
        // This function add a custom Activity Indication under the label
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.bounds.height/6),
            activityIndicator.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.20),
            activityIndicator.heightAnchor.constraint(equalTo: activityIndicator.widthAnchor, multiplier: 1)
            ])
    }
    private func setupWelcomeLabel() {
        // This function add a custom label to under the icon
        view.addSubview(welcomeLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.bounds.height/20),
            welcomeLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/1.2),
            welcomeLabel.heightAnchor.constraint(equalToConstant: view.bounds.height/8)
            ])
    }
}
