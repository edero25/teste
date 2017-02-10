//
//  ContentViewController.swift
//  project
//
//  Created by Eder Frances Oliveira on 05/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import UIKit
import SideMenuController

class ContentDashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, SideMenuControllerDelegate {

    let UItable = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
    let screenSize = UIScreen.main.bounds
    var tabsView = UIView()
    let viewTop = UIView()
    var svwMessages: UIScrollView!
    
   
    
    var MessagesView = UIView()
    let btnSearch = UIButton()
    let btnMessages = UIButton(type: .custom)
    let btnMysales = UIButton(type: .custom)
    let btnNotification = UIButton(type: .custom)
    let btnCount = UIButton(type: .custom)
    let lblRecentMessage = UILabel()
    
    var lineOrange: CALayer = CALayer()
    var lineBlue: CALayer = CALayer()
    
    let widthLine: CGFloat = 30
    
    var collectionView: UICollectionView!
    var data = [CellMessage]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.barTintColor = UIColor(hexString: "#d04e2a")
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
       
        
        data = [CellMessage(name: "Lucas Matos", image: "foto", letter: "P", colorbg: "#e9e9e9", exclamation: true),
                CellMessage(name: "Horrana Grieg", image: "", letter: "V", colorbg: "#a3c74b", exclamation: false),
                CellMessage(name: "Maria Carol", image: "", letter: "M", colorbg: "#5f498c", exclamation: false),
                CellMessage(name: "Eder Frances", image: "", letter: "M", colorbg: "#5f498c", exclamation: false)]
        
        
        
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Dashboard"
        navigationController?.navigationBar.isTranslucent = false
        sideMenuController?.delegate = self
        
        navigationController?.navigationBar.hideBottomHairline()
        
        self.viewTop.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 80)
        self.viewTop.backgroundColor = UIColor(hexString: "#d04e2a")
        self.view.addSubview(self.viewTop)
        
        let lblTextDesc = UILabel(frame: CGRect(x: 18.5, y: 20, width: self.view.frame.size.width / 2, height: 20))
        lblTextDesc.textColor = UIColor(hexString: "535353")
        lblTextDesc.font = UIFont(name: "HelveticaNeue", size: 11)
        lblTextDesc.text = "Seu saldo atual é de:"
        self.viewTop.addSubview(lblTextDesc)
        
        let lblMoney = UILabel(frame: CGRect(x: 18.5, y: lblTextDesc.frame.maxY, width: self.view.frame.size.width, height: 20))
        lblMoney.textColor = UIColor(hexString: "ffffff")
        lblMoney.font = UIFont(name: "HelveticaNeue-bold", size: 24)
        lblMoney.text = "R$ 2.151,23"
        self.viewTop.addSubview(lblMoney)
        
        self.btnSearch.frame = CGRect(x: self.viewTop.frame.width - 45, y: lblTextDesc.frame.maxY - 10, width: 40, height: 40)
        self.btnSearch.setImage(UIImage(named: "ico_lupa"), for: .normal)
        self.btnSearch.setImage(UIImage(named: "ico_lupa"), for: .highlighted)
        self.btnSearch.setTitle("Button", for: UIControlState.normal)
        
        self.viewTop.addSubview(self.btnSearch)
        
        
        self.lblRecentMessage.frame = CGRect(x: 18.5, y: self.viewTop.frame.maxY + 10, width: self.view.frame.size.width, height: 40)
        self.lblRecentMessage.text = "Mensagens Recentes"
        self.lblRecentMessage.font = UIFont(name: "HelveticaNeue", size: 11)
        self.lblRecentMessage.textColor = UIColor(hexString: "535353")
        self.view.addSubview(self.lblRecentMessage)
        
        self.btnCount.frame = CGRect(x: self.view.frame.width - 45, y: self.viewTop.frame.maxY + 20, width: 30, height: 20)
        self.btnCount.backgroundColor = UIColor(hexString: "#e7ad45")
        self.btnCount.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 10)
        self.btnCount.setTitle("+10", for: UIControlState.normal)
        
        self.view.addSubview(self.btnCount)
        
       
        
        self.MessagesView.frame = CGRect(x: 0, y: self.lblRecentMessage.frame.maxY, width: screenWidth - 5, height: 135)
        self.MessagesView.backgroundColor = UIColor(hexString: "#535353")
        self.view.addSubview(self.MessagesView)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        //layout.itemSize = CGSize(width: 70, height: 110)
        layout.itemSize = CGSize(width: screenWidth/4, height: 110)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(contactsCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.MessagesView.addSubview(collectionView)
        
         lines()
        tableSales()
        
        self.btnMessages.translatesAutoresizingMaskIntoConstraints = false
        self.btnMysales.translatesAutoresizingMaskIntoConstraints = false
        self.btnNotification.translatesAutoresizingMaskIntoConstraints = false
        
        self.tabsView.frame = CGRect(x: 0, y: screenHeight - (60 * 2), width: screenWidth, height: 60)
        self.tabsView.backgroundColor = UIColor(hexString: "#f5f5f5")
        self.view.addSubview(self.tabsView)
    
       btnFooter()
        
    }
    
    func tableSales(){
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        self.UItable.frame = CGRect(x: 0, y: self.MessagesView.frame.maxY, width: screenWidth - 5, height: screenHeight - self.MessagesView.frame.maxY)
        self.UItable.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.UItable.separatorInset = .zero
        self.UItable.layoutMargins = .zero
        self.UItable.dataSource = self
        self.UItable.delegate = self
        self.UItable.allowsSelection = false
        self.UItable.register(MySalesCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.UItable)
    }
    
    
    
    func lines(){
    
        self.lineOrange.frame =   CGRect(x: self.view.frame.width - 5, y: self.viewTop.frame.maxY, width: 5, height: 181)
        self.lineOrange.borderWidth = 4
        self.lineOrange.backgroundColor = UIColor(hexString: "#f18320").cgColor
        self.lineOrange.borderColor = UIColor(hexString: "#f18320").cgColor
        self.view.layer.addSublayer(self.lineOrange)
        
        self.lineBlue.frame =   CGRect(x: self.view.frame.width - 5, y: self.lineOrange.frame.maxY, width: 5, height: 500)
        self.lineBlue.borderWidth = 4
        self.lineBlue.backgroundColor = UIColor(hexString: "#4982c5").cgColor
        self.lineBlue.borderColor = UIColor(hexString: "#4982c5").cgColor
        self.view.layer.addSublayer(self.lineBlue)
        
    }

    func btnFooter(){
    
        self.btnMessages.setImage(UIImage(named: "ico_mensagem"), for: .normal)
        self.btnMessages.setImage(UIImage(named: "ico_mensagem"), for: .highlighted)
        self.btnMessages.imageView?.contentMode = .scaleAspectFit
        self.btnMessages.addBorder(side: .Right, color: UIColor.red, width: 1)
        
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
    
    // MARK: DELEGATE UITABLEVIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let textCellIdentifier = "Cell"
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! MySalesCell
        
        
        if(indexPath.row >= 3){
            myCell.imageImportant.isHidden = true
        }
        
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

    // MARK: delegate Collection
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! contactsCell
        
        cell.name.text = data[indexPath.row].name
        
        if(data[indexPath.row].exclamation == true){
            
            cell.imageImportant.isHidden = false
            cell.imageImportant.frame = CGRect(x: cell.imgContact.frame.size.width - 20, y: 9, width: 25, height: 25)
            
        }
        
        cell.imgContact.backgroundColor = UIColor(hexString: data[indexPath.row].colorbg)
        cell.imgContact.setTitle(data[indexPath.row].letter, for: .normal)
        if(data[indexPath.row].image != ""){
            
            cell.imgContact.setImage(UIImage(named:data[indexPath.row].image), for: .normal)
        }
        
        return cell
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(#function) -- \(self)")
    }
    
    func sideMenuControllerDidHide(_ sideMenuController: SideMenuController) {
        print(#function)
    }
    
    func sideMenuControllerDidReveal(_ sideMenuController: SideMenuController) {
        print(#function)
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
