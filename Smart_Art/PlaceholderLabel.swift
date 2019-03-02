//
//  PlaceholderLabel.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/28/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// This custom label will serve as placeholder for the finish quiz cell
// There going to be two label of this type
class PlaceholderLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .yellow
        font = UIFont.boldSystemFont(ofSize: 20)
        textAlignment = .left
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
