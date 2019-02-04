//
//  AnswerButton.swift
//  Smart_Art
//
//  Created by MattHew Phraxayavong on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class AnswerButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        backgroundColor = .purple
        titleLabel?.numberOfLines = 2
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel?.textAlignment = .center
        titleLabel?.adjustsFontSizeToFitWidth = true 
        titleLabel?.minimumScaleFactor = 0.5
        titleLabel?.textColor = .white
        layer.borderWidth = 5
        layer.borderColor = UIColor.white.cgColor
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
