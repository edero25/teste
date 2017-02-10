//
//  tabsController.swift
//  project
//
//  Created by Eder Frances Oliveira on 07/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import UIKit

class tabsController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.barTintColor = UIColor(hexString: "#d04f2a")
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "dashboard"
        navigationController?.navigationBar.isTranslucent = false
        
        let v1 = ContentDashboardViewController()
        v1.tabBarItem.title = "dashboard"
        
        let v2 = ContentMySalesViewController()
        v2.tabBarItem.title = "Sales"
        
        
        self.viewControllers = [v1, v2]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
