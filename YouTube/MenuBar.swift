//
//  MenuBar.swift
//  YouTube
//
//  Created by David Chin on 13/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    lazy var collectionView: UICollectionView = {
        var cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()

    var collectionViewCellId = "cellId"
    var iconNames = ["home", "trending", "subscriptions", "account"]
    

    // MARK: Initialize and set up the view
    override init(frame: CGRect) {

        super.init(frame: frame)
        
        // Register cell class for use in collection view
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: collectionViewCellId)
        
        addSubview(collectionView)

        // MARK: View constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        // MARK: Select the first cell
//        print(collectionView.indexPathsForSelectedItems) // Optional([])
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
//        print(collectionView.indexPathsForSelectedItems) // Optional([])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print(indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // https://developer.apple.com/reference/uikit/uicollectionviewdelegate
    // http://stackoverflow.com/questions/26459668/how-to-listen-to-user-touches-for-uicollectionviewcell-in-ios
    // https://stackoverflow.duapp.com/questions/36487443/why-is-my-uicollectionview-cell-not-clickable-in-my-swift-ios-app
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item) // 0, 1, 2, or 3
//    }
    
    // See 'Responding to Cell Selection section of the book Programming iOS 9 - Dive Deep into Views, View Controllers and Frameworks.pdf
    // Within the book, search also for didhighligh & didselect
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        print(indexPath.item) // 0, 1, 2, or 3
//        print(collectionView.cellForItem(at: indexPath)?.contentView.subviews)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        collectionView.cellForItem(at: indexPath)?.contentView.tintColor = UIColor.purple
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellId, for: indexPath) as! MenuCell
        
        cell.iconName = iconNames[indexPath.item]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class MenuCell: BaseCell {
    
    override func setupViews() {
        super.setupViews()
    }


    // MARK: Cell is highlighted (tapped) & selected
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
//            print(123) // first 123 on touchDown, second 123 on touchUpInside
        }
    }

    override var isSelected: Bool {
        didSet {
//            print("didSet \(isSelected)")
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }

    
    // MARK: imageView and iconName properties
    
    let imageView = UIImageView()

    var iconName: String = "" {
        // blank string suggested by Fix-it, otherwise error: class ManuCell has no initializers
        didSet {
            setupImageView()
        }
    }
    
    private func setupImageView() {
//        print("432 \(isSelected)")
        let image = UIImage(named: iconName)?.withRenderingMode(.alwaysTemplate)

        imageView.image = image
        imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)

        // use contentView
        // https://developer.apple.com/reference/uikit/uicollectionviewcell
        // http://stackoverflow.com/questions/20927522/adding-a-subview-to-a-uicollectionviewcell-that-takes-up-entire-cell-frame
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [
            imageView.widthAnchor.constraint(equalToConstant: CGFloat(28)),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat(28)),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
