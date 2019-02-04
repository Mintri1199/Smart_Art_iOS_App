//
//  buttonStackView.swift
//  Smart_Art
//
//  Created by MattHew Phraxayavong on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class buttonRowStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        spacing = 8
        distribution = .fillEqually
        
        addArrangedSubview(artist1Button)
        addArrangedSubview(artist2Button)
//        addArrangedSubview(artist3Button)
//        addArrangedSubview(artist4Button)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var artist1Button: UIButton = {
        var button = UIButton(frame: .zero)
        button.tag = 0
        button.layer.cornerRadius = 20
        button.setTitle("Amazing1", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .lightGray
        
        return button
    }()
    
    var artist2Button: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Good1", for: .normal)
        button.tag = 1
        button.layer.cornerRadius = 20
        button.titleLabel?.textColor = .white
        button.backgroundColor = .lightGray
        
        return button
    }()
    
//    var artist3Button: UIButton = {
//        var button = UIButton(frame: .zero)
//        button.setTitle("Artist3", for: .normal)
//        button.tag = 3
//        button.titleLabel?.textColor = .white
//        button.backgroundColor = .lightGray
//
//        return button
//    }()
//
//    var artist4Button: UIButton = {
//        var button = UIButton(frame: .zero)
//        button.setTitle("Artist4", for: .normal)
//        button.tag = 4
//        button.titleLabel?.textColor = .white
//        button.backgroundColor = .lightGray
//
//        return button
//    }()
}
