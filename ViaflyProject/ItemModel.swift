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
    let price: String
    
    init(upc: String, item: String, qty: String, category: String, price: String) {
        let catFormatted = category.replacingOccurrences(of: "\\", with: "")
        self.upc = upc
        self.item = item
        //we know there's a qty on each item in csv file. In an app with a less predictable set of data, we may want to make qty and category optionial as opposed to forced unwrapping.
        self.qty = Int(qty)!
        //initialize category enum from string rawValue via csv file
        self.category = ItemCategory(rawValue: catFormatted)!
        self.price = price
    }
}

enum ItemCategory: String {
    //note enum naming convention is lowerCamelCase as of Swift3
    case accessories = "Accessories"
    case mens = "Men's"
    case outerwear = "Outerwear"
    case womens = "Women's"
}
