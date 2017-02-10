//
//  CustomSideMenuController.swift
//  project
//
//  Created by Eder Frances Oliveira on 05/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import Foundation
import SideMenuController

class CustomSideMenuController: SideMenuController {
    
    required init?(coder aDecoder: NSCoder) {
        
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "menu")
        SideMenuController.preferences.drawing.sidePanelPosition = .overCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 300
        SideMenuController.preferences.drawing.centerPanelShadow = false
        SideMenuController.preferences.animating.statusBarBehaviour = .slideAnimation
        SideMenuController.preferences.animating.transitionAnimator = FadeAnimator.self
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegue(withIdentifier: "dashboard", sender: nil)
        performSegue(withIdentifier: "containSideMenu", sender: nil)
    }
}
