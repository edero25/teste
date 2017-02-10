//
//  HeaderMenuCell.swift
//  project
//
//  Created by Eder Frances Oliveira on 09/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.

import UIKit

class HeaderMenuCell: UITableViewCell {

    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-bold", size: 15.0)
        label.textColor = UIColor.white
        return label
    }()
    
    let email: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-light", size: 13.0)
        label.textColor = UIColor.red
        return label
    }()
    
    let imgBg : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    let imgContact : UIButton = {
        
        let button = UIButton(type: .custom)
        
        button.frame = CGRect(x: 19, y: 70, width: 70, height: 70)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setTitle("DN",for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15.0)
        return button
    }()
    
    
    func setupViews(){
        
        addSubview(imgBg)
        addSubview(imgContact)
        addSubview(name)
        addSubview(email)
        
        self.name.frame = CGRect(x: 19, y: self.imgContact.frame.maxY, width: self.contentView.frame.size.width, height: 20)
        self.email.frame = CGRect(x: 19, y: self.name.frame.maxY, width: self.contentView.frame.size.width, height: 20)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setupViews()
        
    }

    
}
