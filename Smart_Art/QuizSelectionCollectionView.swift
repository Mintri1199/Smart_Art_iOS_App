//
//  QuizSelectionCollectionView.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/18/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class QuizSelectionCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .red
        dataSource = self
        delegate = self
        translatesAutoresizingMaskIntoConstraints = false 
        register(QuizSelectionCell.self, forCellWithReuseIdentifier: "quizCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as! QuizSelectionCell
        cell.backgroundColor = .white
        return cell
    }
}

