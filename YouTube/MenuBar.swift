//
//  MenuBar.swift
//  YouTube
//
//  Created by David Chin on 13/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class MenuBar: UIView {
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        return cv
//    }()
    
    private func setup() {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        
        addSubview(collectionView)
        addConstraints(withFormat: "H:|[v0]|", views: collectionView)
        addConstraints(withFormat: "V:|[v0]|", views: collectionView)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
//        addSubview(collectionView)
//        addConstraints(withFormat: "H:|[v0]|", views: collectionView)
//        addConstraints(withFormat: "V:|[v0]|", views: collectionView)
        
//        backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
