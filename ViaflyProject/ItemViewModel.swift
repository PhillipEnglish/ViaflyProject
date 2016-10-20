//
//  ItemViewModel.swift
//  ViaflyProject
//
//  Created by Phillip English on 10/19/16.
//  Copyright © 2016 Vitki Arts. All rights reserved.
//

import Foundation
import CSVImporter

class ItemViewModel {
    
    var itemArray: [ItemModel] = []
    
    func populateArray() {
        guard let path = Bundle.main.path(forResource: "Inventory", ofType: "csv") else {return}
        let importer = CSVImporter<[String: String]>(path: path)
        importer.startImportingRecords(structure: { (headerValues) -> Void in
            
            print(headerValues) // => ["firstName", "lastName"]
            
        }) { $0 }.onFinish { importedItems in
            
            for item in importedItems {
                print(item)
                let itemModel = ItemModel(upc: item["UPC"]!, item: item["Item"]!, qty: item["Qty."]!, category: item["Category"]!)
                self.itemArray.append(itemModel)
                print(self.itemArray.count)
            }
        }
    }

}
