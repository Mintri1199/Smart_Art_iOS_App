//
//  CollectionViewCell.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class QuizCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        setupImageView()
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageView: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.image = UIImage(named: "placeholder")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var quizLabel = QuizLabel(frame: .zero)
    
    private func setupImageView() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
            ])
    }
    
    private func setupLabel() {
        addSubview(quizLabel)
        
        NSLayoutConstraint.activate([
            quizLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            quizLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            quizLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            quizLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
    }
    
}
