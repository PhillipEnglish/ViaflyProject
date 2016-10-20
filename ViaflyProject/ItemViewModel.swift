//
//  ItemViewModel.swift
//  ViaflyProject
//
//  Created by Phillip English on 10/19/16.
//  Copyright © 2016 Vitki Arts. All rights reserved.
//

import Foundation
import CSVImporter

struct ItemViewModel {
    
    var itemArray: [ItemModel] = []
    
    func populateArray() {
        guard let path = Bundle.main.path(forResource: "Inventory", ofType: "csv") else {return}
        let importer = CSVImporter<[String: String]>(path: path)
        importer.startImportingRecords(structure: { (headerValues) -> Void in
            
            print(headerValues) // => ["firstName", "lastName"]
            
        }) { $0 }.onFinish { importedRecords in
            
            for record in importedRecords {
                print(record) // => e.g. ["firstName": "Harry", "lastName": "Potter"]
               // print(record["firstName"]) // prints "Harry" on first, "Hermione" on second run
               // print(record["lastName"]) // prints "Potter" on first, "Granger" on second run
            }
        }
    }

}
