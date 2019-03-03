//
//  FinishCVCell.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/28/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Custom Cell for Finish Collection View
class FinishCVCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 30
        setupImageView()
        setupLabelsStack()
        setupLearnMoreButton()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Custom UIs
    var imageView: UIImageView = {
        var view = UIImageView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 30
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var labelsStack = OuterLabelStackView(frame: .zero)
    var learnMoreButton = FindOutButton(frame: .zero)
    // Functions that will set up the UI components
    private func setupImageView() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
            ])
    }
    private func setupLabelsStack() {
        addSubview(labelsStack)
        NSLayoutConstraint.activate([
            labelsStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            labelsStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            labelsStack.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            labelsStack.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)
            ])
    }
    func setupLearnMoreButton() {
        addSubview(learnMoreButton)
        NSLayoutConstraint.activate([
            learnMoreButton.topAnchor.constraint(equalTo: labelsStack.bottomAnchor, constant: 10),
            learnMoreButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            learnMoreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            learnMoreButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
            ])
    }
}
