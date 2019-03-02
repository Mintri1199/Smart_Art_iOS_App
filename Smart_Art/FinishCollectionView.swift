//
//  FinishCollectionView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/28/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Custom CollectionView that will be the main component for FinishVC
class FinishCollectionView: UICollectionView, UICollectionViewDataSource {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .mainBackgroundColor
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        register(FinishCVCell.self, forCellWithReuseIdentifier: "FinishCell")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let finishVC = findViewController() as? FinishViewController else { print("Ill assign Collection View"); return 0 }
        guard let result = finishVC.userResult?.correctAnswers!.count else { print("Can not read result object"); return 4 }
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "FinishCell", for: indexPath) as? FinishCVCell
        return cell!
    }
}

extension FinishCollectionView: UICollectionViewDelegate {
}
