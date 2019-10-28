//
//  UserCell.swift
//  User Demo
//
//  Created by Akib Quraishi on 27/10/2019.
//  Copyright © 2019 AkibMakesApps. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    var userDetails:UserViewData! {
        didSet {
            imageView.downloadImageWithCache(stringURL:userDetails.imageURL)
            nameLabel.text = userDetails.fullName
            addressLabel.text = "\(userDetails.city),\n\(userDetails.country)"
        }
    }
    
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 84).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize:20)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize:17)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        clipsToBounds = true
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1).cgColor
        
        let labelsStackView = UIStackView(arrangedSubviews: [
            nameLabel, addressLabel])
        labelsStackView.axis = .vertical
        
        let overallStackView = UIStackView(arrangedSubviews: [
            imageView, labelsStackView ])
        overallStackView.spacing = 16
        overallStackView.axis = .horizontal
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top:8, left: 8, bottom: 8, right:8))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
