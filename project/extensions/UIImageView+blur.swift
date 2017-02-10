//
//  UIImageView+blur.swift
//  project
//
//  Created by Eder Frances Oliveira on 09/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension UIImageView
{
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
