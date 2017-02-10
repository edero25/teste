//
//  MySalesCell.swift
//  project
//
//  Created by Eder Frances Oliveira on 05/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import UIKit

class MySalesCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor(hexString: "#535353")
        label.font = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let dataId: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 11.0)
        label.textColor = UIColor(hexString: "#919191")
        return label
    }()
    
    
    let money: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-bold", size: 15.0)
        label.textColor = UIColor(hexString: "#4982c5")
        label.textAlignment = .right
        return label
    }()
    
    let imageImportant: UIImageView = {
        
        let imageI = UIImageView()
        imageI.image = UIImage(named: "ico_alert")
        imageI.translatesAutoresizingMaskIntoConstraints = false
        return imageI
        
    }()
    
    
    
    func setupViews() {
        addSubview(title)
        addSubview(imageImportant)
        addSubview(dataId)
        addSubview(money)
        
        let views : [String : AnyObject] = ["title": title,
                                            "dataId": dataId,
                                            "money": money,
                                            "imageImportant": imageImportant]
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[imageImportant(20)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[money]-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[title(60)]-[dataId]-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-18.5-[title]-[imageImportant(20)]-18.5-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-18.5-[dataId]-[money]-18.5-|", options: [], metrics: nil, views: views))
        
        
        
    }
    
}
