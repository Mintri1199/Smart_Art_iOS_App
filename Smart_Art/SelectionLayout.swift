//
//  SelectionLayout.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/18/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Custom layout rules for collectionView in selection screen
class SelectionLayout: UICollectionViewFlowLayout {
    override func prepare() {
        // TODO: Revised this logic to better fit on other phones
        guard let cv = collectionView else { return }
        self.scrollDirection = .vertical
        self.minimumLineSpacing = 20
        self.minimumInteritemSpacing = 20
        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).width
        let minimumCellWidth = CGFloat(120)
        let maxNumColumn = Int(availableWidth/minimumCellWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumn)).rounded(.up)
        self.itemSize = CGSize(width: cellWidth - 20, height: cv.bounds.height/3.5)
        self.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        self.sectionInsetReference = .fromSafeArea
    }
}
