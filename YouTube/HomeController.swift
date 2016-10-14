//
//  ViewController.swift
//  YouTube
//
//  Created by David Chin on 11/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        // http://timdietrich.me/blog/swift-ios-customizing-navigation-and-tab-bar-appearance/ instead of video's use of a custom UILabel that additionally hardcodes a left position for the label - if required, re-visit the video at https://www.youtube.com/watch?v=APQVltARKF8 17:00
//        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // Video's approach for navigationItem "title"
        let navigationItemTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        navigationItemTitleLabel.text = "Home"
        navigationItemTitleLabel.textColor = UIColor.white
        navigationItemTitleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = navigationItemTitleLabel

        // Set up collection view
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        
        // Set up MenuBar
        setupMenuBar()
    }

    private func setupMenuBar() {
        let menuBar = MenuBar()
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(menuBar)
    }
    
    // Main Collection View of thumbnails
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16 // 16:9 HD ratio
        return CGSize(width: view.frame.width, height: height + 16 + 69) // add back vertical space needed by constraints, etc
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
