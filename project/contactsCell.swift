//
//  contactsCell.swift
//  project
//
//  Created by Eder Frances Oliveira on 08/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import UIKit

class contactsCell: UICollectionViewCell {

    let modelName = UIDevice.current.modelName
    var sizeMessage: CGSize = CGSize()
    
    
    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-light", size: 10.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    
    
    
    
    
    let imgContact : UIButton = {
        
        let button = UIButton(type: .custom)
        
        //button.frame = CGRect(x: 5, y: 10, width: 80, height: 80)

        button.titleLabel?.font = UIFont(name: "HelveticaNeue-bold", size: 30.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let imageImportant: UIImageView = {
        
        let imageI = UIImageView()
        imageI.image = UIImage(named: "ico_alert")
        imageI.translatesAutoresizingMaskIntoConstraints = false
        return imageI
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews(){
        
        addSubview(name)
        addSubview(imgContact)
        addSubview(imageImportant)
        
    
        
        switch modelName {
        case "iPhone 5", "iPhone 5c", "iPhone 5s":
                sizeMessage = CGSize(width: 60, height: 60)
            break
            
        case "iPhone 6", "iPhone 6s", "iPhone 6 Plus":
                sizeMessage = CGSize(width: 80, height: 80)
            break
            
        case "iPhone 7", "iPhone 7 Plus":
                sizeMessage = CGSize(width: 80, height: 80)
            break
            
        default:
            sizeMessage = CGSize(width: 60, height: 60)
            break
            
        }
        self.imgContact.frame = CGRect(origin: CGPoint(x: 10, y: 10), size: sizeMessage)
        self.imgContact.layer.cornerRadius = 0.5 * self.imgContact.bounds.size.width
        self.imgContact.clipsToBounds = true
        
        self.name.frame = CGRect(x: 0, y: self.imgContact.frame.maxY, width: self.contentView.frame.size.width, height: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }


}
