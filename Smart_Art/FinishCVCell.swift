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
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var imageView: UIImageView = {
        var view = UIImageView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 30
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupImageView () {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
            ])
    }
     
}
