//
//  QuizScoreLabel.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/18/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class QuizScoreLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        numberOfLines = 3
        backgroundColor = .yellow
        text = "Score: 0"
        font = UIFont.systemFont(ofSize: 30)
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Provide padding to the text
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        super.drawText(in: rect.inset(by: insets))
    }
    
    // Round the bottom corners
    override func layoutSubviews() {
        self.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 30)
    }
}
