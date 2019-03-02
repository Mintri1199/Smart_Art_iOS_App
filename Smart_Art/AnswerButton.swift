//
//  AnswerButton.swift
//  Smart_Art
//
//  Created by MattHew Phraxayavong on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit
// Custom button for Custom stack view
class AnswerButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        backgroundColor = .toolBarColor
        titleLabel?.numberOfLines = 2
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel?.textAlignment = .center
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.5
        titleLabel?.textColor = .white
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func rightAnswer() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.backgroundColor = UIColor.green
            self.titleLabel?.textColor = .white
        }) { (_) in
            self.layer.removeAllAnimations()
        }
    }
}
