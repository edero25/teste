//  ContentMySalesViewController.swift
//  project
//  Created by Eder Frances Oliveira on 05/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.

import UIKit
import SideMenuController

class ContentMySalesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SideMenuControllerDelegate {
   
    let UItable = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
    var tabsView = UIView()
    let screenSize = UIScreen.main.bounds
    let btnMessages = UIButton()
    let btnMysales = UIButton()
    let btnNotification = UIButton()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.barTintColor = UIColor(hexString: "#4982c5")
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.navigationController?.navigationBar.tintColor = UIColor.blue
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Minhas vendas"
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        self.UItable.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - 60)
        self.UItable.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.UItable.separatorInset = .zero
        self.UItable.layoutMargins = .zero
        self.UItable.dataSource = self
        self.UItable.delegate = self
        self.UItable.allowsSelection = false
        self.UItable.register(MySalesCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.UItable)
        
        self.btnMessages.translatesAutoresizingMaskIntoConstraints = false
        self.btnMysales.translatesAutoresizingMaskIntoConstraints = false
        self.btnNotification.translatesAutoresizingMaskIntoConstraints = false
        
        self.tabsView.frame = CGRect(x: 0, y: screenHeight - 60, width: screenWidth, height: 60)
        self.tabsView.backgroundColor = UIColor(hexString: "#f5f5f5")
        self.view.addSubview(self.tabsView)
        
        btnFooter()
        
    }
    
    func btnFooter(){
        
        self.btnMessages.setImage(UIImage(named: "ico_mensagem"), for: .normal)
        self.btnMessages.setImage(UIImage(named: "ico_mensagem"), for: .highlighted)
        self.btnMessages.imageView?.contentMode = .scaleAspectFit
        
        self.btnMysales.setImage(UIImage(named: "ico_minhas_vendas"), for: .normal)
        self.btnMysales.setImage(UIImage(named: "ico_minhas_vendas"), for: .highlighted)
        self.btnMysales.imageView?.contentMode = .scaleAspectFit
        
        self.btnNotification.setImage(UIImage(named: "ico_notificacoes"), for: .normal)
        self.btnNotification.setImage(UIImage(named: "ico_notificacoes"), for: .highlighted)
        self.btnNotification.imageView?.contentMode = .scaleAspectFit
        
        self.tabsView.addSubview(self.btnMessages)
        self.tabsView.addSubview(self.btnMysales)
        self.tabsView.addSubview(self.btnNotification)
        
        let views : [String : AnyObject] = ["btnMessages": self.btnMessages,
                                            "btnMysales": self.btnMysales,
                                            "btnNotification": self.btnNotification]
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-13-[btnMessages(31)]", options: [], metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-13-[btnMysales(31)]", options: [], metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-13-[btnNotification(31)]", options: [], metrics: nil, views: views))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btnMessages][btnMysales(==btnMessages)][btnNotification(==btnMessages)]|", options: [], metrics: nil, views: views))
        
    }
    

    // MARK: DELEGATE SideMenuControllerDelegate
    
    func sideMenuControllerDidHide(_ sideMenuController: SideMenuController) {
        print(#function)
    }
    
    func sideMenuControllerDidReveal(_ sideMenuController: SideMenuController) {
        print(#function)
    }
    
    
    // MARK: DELEGATE UITABLEVIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let textCellIdentifier = "Cell"
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! MySalesCell
        
        
        myCell.imageImportant.isHidden = true
        
        myCell.title.text = "Como decorar uma festa infantil maravilhosa..."
        myCell.dataId.text = "id: 23232323232 10/12/2017"
        myCell.money.text = "R$ 12.434,00"
        return myCell

    }
    
    func tableView(_tableView: UITableView, willDisplayCell cell: UITableViewCell,  forRowAtIndexPath indexPath: NSIndexPath) {
        
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return  115;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        tableView.backgroundColor = UIColor.clear
        
    }
    
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor(hexString: "#f4f4f4")
        }else{
            cell.backgroundColor = UIColor(hexString: "#ffffff")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
