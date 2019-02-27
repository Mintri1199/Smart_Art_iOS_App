//
//  ProgressionButton.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/26/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class ProgressionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        backgroundColor = .toolBarColor
        setTitle("Next", for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel?.textAlignment = .center
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.textColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
