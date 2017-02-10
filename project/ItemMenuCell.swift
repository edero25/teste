//
//  ItemMenuCell.swift
//  project
//
//  Created by Eder Frances Oliveira on 09/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import UIKit

class ItemMenuCell: UITableViewCell {

    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-light", size: 15.0)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let icon : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    let countItens: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.orange
        label.textColor = UIColor.white
        label.font = UIFont(name: "HelveticaNeue-light", size: 15.0)
        return label
    }()
    
    
    func setupViews(){
        
        addSubview(name)
        addSubview(icon)
        addSubview(countItens)
        
       
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
        
        
    }

    
}
