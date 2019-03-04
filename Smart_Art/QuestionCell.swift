//
//  CollectionViewCell.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit
import AVFoundation
import NVActivityIndicatorView

class QuestionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainBackgroundColor
        addSubview(libraryActivityIndicator)
        NSLayoutConstraint.activate([
            libraryActivityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            libraryActivityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            libraryActivityIndicator.heightAnchor.constraint(equalTo: heightAnchor),
            libraryActivityIndicator.widthAnchor.constraint(equalTo: widthAnchor)
            ])
        libraryActivityIndicator.startAnimating()
        setupImageView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var imageView: UIImageView = {
        var view = UIImageView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .cyan
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var quizLabel = QuestionLabel(frame: .zero)
    private func setupImageView() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 1, constant: -30),
            imageView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 1, constant: -30)
            ])
    }
    // Curently disable
    private func setupLabel() {
        addSubview(quizLabel)
        NSLayoutConstraint.activate([
            quizLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            quizLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            quizLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            quizLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
    }
    var libraryActivityIndicator: NVActivityIndicatorView = {
        var indicator = NVActivityIndicatorView(frame: .zero, type: .orbit, color: .white, padding: 50)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    // Update the cell when assigning the image
    func updateCell(with image: UIImage?) {
        if let imageToDisplay = image {
            imageView.image = imageToDisplay
            updateImageView(image: imageToDisplay)
        } else {
            imageView.image = nil
        }
    }
    // Update the image view contraints after the image has been set
    func updateImageView(image: UIImage) {
        imageView.layoutIfNeeded()
        // Getting the rect of image
        let imageRect = AVMakeRect(aspectRatio: image.size, insideRect: imageView.frame)
        imageView.removeConstraints(imageView.constraints)
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageRect.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageRect.width).isActive = true
        imageView.setNeedsLayout()
        // Add border to represent a frame
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        libraryActivityIndicator.stopAnimating()
    }
}
