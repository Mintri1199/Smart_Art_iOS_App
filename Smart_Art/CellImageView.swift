//
//  CellImageView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/18/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class CellImageView: UIImageView {
    var radius = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(named: "cellPlaceholder")
        contentMode = .scaleToFill
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners([.topRight, .topLeft], radius: CGFloat(radius))
    }
}
