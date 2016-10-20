//
//  ItemModel.swift
//  ViaflyProject
//
//  Created by Phillip English on 10/19/16.
//  Copyright © 2016 Vitki Arts. All rights reserved.
//

import Foundation

struct ItemModel {
    
    let upc: String
    let item: String
    let qty: Int
    let category: ItemCategory
    
    init(upc: String, item: String, qty: Int, category: String) {
        self.upc = upc
        self.item = item
        self.qty = qty
        //initialize category enum from string rawValue via csv file
        self.category = ItemCategory(rawValue: category)!
    }
}

enum ItemCategory: String {
    //note enum naming convention is lowerCamelCase as of Swift3
    case accessories = "Accessories"
    case mens = "Men's"
    case outerwear = "Outerwear"
    case womens = "Women's"
}
