//
//  FinishCVLayout.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/28/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Custom layout for Finish CollectionView
class FinishCVLayout: UICollectionViewFlowLayout {
    override func prepare() {
        guard let collectionView = collectionView else { return }
        self.scrollDirection = .vertical
        self.minimumLineSpacing = 20
        // Setting the size of the cell
        self.itemSize = CGSize(width: collectionView.bounds.width - 50, height: collectionView.bounds.height/3)
        // Setting the insets of the collection view
        self.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    }
}
