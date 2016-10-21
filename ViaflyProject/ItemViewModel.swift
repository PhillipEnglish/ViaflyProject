//
//  ItemViewModel.swift
//  ViaflyProject
//
//  Created by Phillip English on 10/19/16.
//  Copyright © 2016 Vitki Arts. All rights reserved.
//

import Foundation
import CSVImporter
import RxSwift
import RxCocoa

class ItemViewModel {
    
    //var itemArray: [ItemModel] = []
    var itemArray = Variable<[ItemModel]>([])
    var storageArray = [ItemModel]()
    
    func populateArray() {
        guard let path = Bundle.main.path(forResource: "Inventory", ofType: "csv") else {return}
        let importer = CSVImporter<[String: String]>(path: path)
        importer.startImportingRecords(structure: { (headerValues) -> Void in
            
            print(headerValues) // => ["firstName", "lastName"]
            
        }) { $0 }.onFinish { importedItems in
            
            for item in importedItems {
                //print(item)
                let itemModel = ItemModel(upc: item["UPC"]!, item: item["Item"]!, qty: item["Qty."]!, category: item["Category"]!, price: item["Price"]!)
                
                //don't add the item to the presntable array if it's not available. We know all quantities in the csv file, but if scaled to a larger dataset, we want to check that items are not out of stock.
                if itemModel.qty > 0 {self.itemArray.value.append(itemModel)}
                print(self.itemArray.value.count)
            }
            self.itemArray.value.sort{$0.priceDouble > $1.priceDouble}
            self.populateStorageArray()
        }
    }
    
    func populateStorageArray()
    {
        storageArray = itemArray.value
    }
    
    func resetArray()
    {
        itemArray.value = storageArray
    }

}
