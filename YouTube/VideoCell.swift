//
//  VideoCell.swift
//  YouTube
//
//  Created by David Chin on 13/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "taylor-swift-blank-space")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let userProfileImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "taylor-swift-profile")
        view.layer.cornerRadius = 22
        view.layer.masksToBounds = true
        return view
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Taylor Swift - Blank Space"
        return view
    }()
    
    let subtitleTextView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "TaylorSwiftVEVO • 11,604,684,607 views • 2 years ago"
        //        view.textContainerInset = UIEdgeInsets.init(top: 0, left: -4, bottom: 8, right: 0) // from UIEdgeInsetsMake(_:_:_:_:) docs - top, left, bottom, right - default is (8, 0, 8, 0) per textContainerInset docs - values used in the initializer obtained by eyeballing alignment of text with titleLabel
        //        view.textContainer.lineFragmentPadding = 0
        //        view.textContainerInset = UIEdgeInsets.zero
        view.textContainerInset = UIEdgeInsets(top: 0, left: -view.textContainer.lineFragmentPadding, bottom: 8, right: 0) // settled on http://stackoverflow.com/questions/746670/how-to-lose-margin-padding-in-uitextview/36827271#36827271 and after reading https://developer.apple.com/library/content/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/CustomTextProcessing/CustomTextProcessing.html#//apple_ref/doc/uid/TP40009542-CH4-SW1 & https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/TextStorageLayer/Tasks/Region.html
        view.textColor = UIColor.lightGray
        // print(view.textContainerInset) // -> UIEdgeInsets(top: 0.0, left: -5.0, bottom: 8.0, right: 0.0)
        //        view.backgroundColor = UIColor.darkGray
        //        view.textColor = UIColor.lightText
        return view
    }()
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstraints(withFormat: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraints(withFormat: "H:|-16-[v0(44)]", views: userProfileImageView)
        addConstraints(withFormat: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        addConstraints(withFormat: "H:|[v0]|", views: separatorView)
        
        // titleLabel constraints - top, left, right-aligned with right of thumbnailImageView, height
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        // subtitleTextView constraints - top, left, right-aligned with right of thumbnailImageView, height
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
        
        //         TEMP: use these temporary constraints to help visualize the placement of title label as we add NSLayoutConstraint.init(item:) to titleLabel & subTitleLabel
        //        addConstraints(withFormat: "V:[v0(20)]", views: titleLabel)
        //        addConstraints(withFormat: "H:|[v0]|", views: titleLabel)
        //        END TEMP
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
