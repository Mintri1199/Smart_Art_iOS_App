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
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    func setup () {
//        addSubview(<#T##view: UIView##UIView#>)
//
//        NSLayoutConstraint.activate([
//            .topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>),
//            .bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>),
//            .leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>),
//            .trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>),
//            ])
//
//    }
}
