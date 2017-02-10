//
//  MenuController.swift
//  project
//
//  Created by Eder Frances Oliveira on 05/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import UIKit

struct CellData {
    
    let name : String!
    let email : String!
    let title : String!
    let icon: String!
    let countItem: String!
    let view: String!
    
}


class MenuController: UITableViewController {

    private var previousIndex: NSIndexPath?
    
    var arrayOfCellData = [CellData]()
    
    var heigthCell = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfCellData = [CellData(name: "EDER F O", email: "eder@eia.com.br", title : "", icon: "", countItem: "", view: ""),
                           CellData(name: "", email: "", title : "Dashboard", icon: "ico_dashboard", countItem: "", view: "dashboard"),
                           CellData(name: "", email: "", title : "Minhas Vendas", icon: "ico_minhas_vendas", countItem: "", view: "sales"),
                           CellData(name: "", email: "", title : "Meus Produtos", icon: "ico_meus_produtos", countItem: "", view: ""),
                           CellData(name: "", email: "", title : "Afiliados", icon: "ico_afiliados", countItem: "121", view: ""),
                           CellData(name: "", email: "", title : "Mensagens", icon: "ico_mensagem", countItem: "+50", view: "messages"),
                           CellData(name: "", email: "", title : "Notificações", icon: "ico_notificacoes", countItem: "", view: ""),
                           CellData(name: "", email: "", title : "Minha conta", icon: "ico_minha_conta", countItem: "", view: ""),
                           CellData(name: "", email: "", title : "Sobre o App", icon: "ico_sobre_o_app", countItem: "", view: "")
                            ]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.separatorStyle = .none
        tableView.separatorColor = UIColor.clear
        
        
        if indexPath.row == 0{
            
            let cell = Bundle.main.loadNibNamed("HeaderMenuCell", owner: self, options: nil)?.first as! HeaderMenuCell
            
            cell.backgroundColor = UIColor.orange
            
            cell.imgBg.image = UIImage(named:"foto")
            cell.imgBg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 197)
            cell.imgBg.addBlurEffect()
            
            cell.name.text = arrayOfCellData[indexPath.row].name
            cell.email.text = arrayOfCellData[indexPath.row].email
            cell.imgContact.setImage(UIImage(named:"foto"), for: .normal)
            
            
            return cell
            
        }else{
            
            let cell = Bundle.main.loadNibNamed("ItemMenuCell", owner: self, options: nil)?.first as! ItemMenuCell
            
            cell.icon.image = UIImage(named: arrayOfCellData[indexPath.row].icon)
            cell.icon.frame = CGRect(x: 19, y: 0, width: 30, height: 56)
            cell.icon.contentMode = .scaleAspectFit
            
            cell.name.text = arrayOfCellData[indexPath.row].title
            cell.name.frame = CGRect(x: cell.icon.frame.maxX + 20, y: 0, width: 200, height: 56)
            
            if(arrayOfCellData[indexPath.row].countItem != ""){
            
                cell.countItens.frame = CGRect(x: self.view.frame.width - 45, y: 7, width: 35, height: 35)
                cell.countItens.backgroundColor = UIColor(hexString: "#e7ad45")
                cell.countItens.text = arrayOfCellData[indexPath.row].countItem
                cell.countItens.textAlignment = .center
            }
            
            
            return cell
            
        }
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        
      
        
        if indexPath.row > 0{
            
            if let index = previousIndex {
                tableView.deselectRow(at: index as IndexPath, animated: true)
            }
        
            if arrayOfCellData[indexPath.row].view != ""{
            
                sideMenuController?.performSegue(withIdentifier: arrayOfCellData[indexPath.row].view, sender: nil)
                previousIndex = indexPath as NSIndexPath?
            }
            
        
        }
        
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            
            heigthCell = 197
        }else{
            
            heigthCell = 56
        }
        
        return heigthCell
    }

    
}
