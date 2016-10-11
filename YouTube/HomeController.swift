//
//  ViewController.swift
//  YouTube
//
//  Created by David Chin on 11/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"

        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.red
        
        return cell
    }
}

