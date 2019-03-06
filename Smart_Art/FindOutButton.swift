//
//  FindOutButton.swift
//  Smart_Art
//
//  Created by Jackson Ho on 3/2/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class FindOutButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        backgroundColor = .toolBarColor
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel?.textAlignment = .center
        setTitle("LEARN MORE", for: .normal)
        titleLabel?.textColor = .white
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
