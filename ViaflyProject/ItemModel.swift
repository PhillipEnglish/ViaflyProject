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
    
    //set priceDouble with default value incase optional value is nil on init
    //priceDouble exists to solve issues with sorting by price as a string (example: 54 is > 530 when sorted by string)
    var priceDouble: Double = 0
    
    
    init(upc: String, item: String, qty: String, category: String, price: String) {
        let catFormatted = category.replacingOccurrences(of: "\\", with: "")
        self.upc = upc
        self.item = item
        //we know there's a qty on each item in the csv file. In an app with a less predictable set of data, we may want to handle nil cases in qty and category as opposed to forced unwrapping.
        self.qty = Int(qty)!
        //initialize category enum from string rawValue via csv file
        self.category = ItemCategory(rawValue: catFormatted)!
        self.price = price
        
        
       if makePriceDouble(price: price) != nil {
        self.priceDouble = makePriceDouble(price: price)!
        }
        
    }

}


 //this extension is here for readibility and aesthetic reasons moreso than the usual extensibility reasons
extension ItemModel {
   
    func makePriceDouble(price: String) -> Double? {
        let newString = price.replacingOccurrences(of: "$", with: "")
        guard let priceDble = Double(newString) else {return nil }
        return priceDble
    }
}

enum ItemCategory: String {
    //note enum naming convention is lowerCamelCase as of Swift3
    case accessories = "Accessories"
    case mens = "Men's"
    case outerwear = "Outerwear"
    case womens = "Women's"
}

