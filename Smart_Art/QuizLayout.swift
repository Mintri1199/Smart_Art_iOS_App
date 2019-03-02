//
//  QuizLayout.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// layout rules for question collectionView
class QuizLayout: UICollectionViewFlowLayout {
    override func prepare() {
        guard let cv = collectionView else { return }
        self.scrollDirection = .horizontal
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
        self.itemSize = CGSize(width: cv.bounds.width, height: cv.bounds.height)   // Setting the cell size to be the same as the collectionView
        
    }
}
