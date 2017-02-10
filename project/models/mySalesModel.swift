//
//  mySalesModel.swift
//  project
//
//  Created by Eder Frances Oliveira on 05/02/17.
//  Copyright © 2017 Eder Frances Oliveira. All rights reserved.
//

import UIKit


class mySalesModel {

    var id: Int!
    var title: String!
    var money: String!
    var important: Bool!
    var dateSale: String!
    
    init(id: Int, title: String, money: String, important: Bool, dateSale: String){
        
        self.id = id
        self.title = title
        self.money = money
        self.important = important
        self.dateSale = dateSale

    }
    
}
