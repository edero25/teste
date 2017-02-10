//
//  ContentContactsViewController.swift
//  project
//
//  Created by Eder Frances Oliveira on 08/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import UIKit
import SideMenuController



class ContentContactsViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    var data = [CellMessage]()
    let screenSize = UIScreen.main.bounds
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.barTintColor = UIColor(hexString: "#e7ad45")
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
    
        
    
        data = [CellMessage(name: "Lucas Matos", image: "foto", letter: "P", colorbg: "#e9e9e9", exclamation: true),
                CellMessage(name: "Horrana Grieg", image: "", letter: "V", colorbg: "#a3c74b", exclamation: false),
                CellMessage(name: "Maria Carol", image: "", letter: "M", colorbg: "#5f498c", exclamation: false),
                CellMessage(name: "Eder Frances", image: "", letter: "D", colorbg: "#4982c5", exclamation: false),
                CellMessage(name: "Lucas Matos", image: "foto", letter: "P", colorbg: "#e9e9e9", exclamation: false),
                CellMessage(name: "Horrana Grieg", image: "", letter: "V", colorbg: "#a3c74b", exclamation: false),
                CellMessage(name: "Maria Carol", image: "", letter: "M", colorbg: "#5f498c", exclamation: false),
                CellMessage(name: "Eder Frances", image: "", letter: "D", colorbg: "#4982c5", exclamation: false),
                CellMessage(name: "Lucas Matos", image: "foto", letter: "P", colorbg: "#e9e9e9", exclamation: false),
                CellMessage(name: "Horrana Gireg", image: "", letter: "V", colorbg: "#a3c74b", exclamation: false),
                CellMessage(name: "Maria Carol", image: "", letter: "M", colorbg: "#5f498c", exclamation: false),
                CellMessage(name: "Eder Frances", image: "", letter: "D", colorbg: "#4982c5", exclamation: false),
                CellMessage(name: "Lucas Matos", image: "foto", letter: "P", colorbg: "#e9e9e9", exclamation: false),
                CellMessage(name: "Horrana Grieg", image: "", letter: "V", colorbg: "#a3c74b", exclamation: false),
                CellMessage(name: "Maria Carol", image: "", letter: "M", colorbg: "#5f498c", exclamation: false),
                CellMessage(name: "Eder Frances", image: "", letter: "D", colorbg: "#4982c5", exclamation: false)
                ]

        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Mensagens"
        navigationController?.navigationBar.isTranslucent = false
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/4, height: 130)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(contactsCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! contactsCell
        
            //cell.backgroundColor = UIColor.orange
        
        
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
