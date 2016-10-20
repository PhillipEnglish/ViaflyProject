//
//  MainViewController.swift
//  ViaflyProject
//
//  Created by Phillip English on 10/19/16.
//  Copyright © 2016 Vitki Arts. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa



class MainViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let itemVM = ItemViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemVM.populateArray()
        
        itemVM.itemArray.asObservable().observeOn(MainScheduler.instance).bindTo(tableView.rx.items(cellIdentifier: "ItemCell")) {row, itemModel, cell in
            cell.textLabel?.text = itemModel.item
            cell.detailTextLabel?.text = itemModel.category.rawValue
            
//            var hue: CGFloat
//            hue = 1 / 196.62 * CGFloat(row)
//            cell.backgroundColor = UIColor(hue: hue, saturation: 0.33, brightness: 0.85, alpha: 1)
        }
        .addDisposableTo(disposeBag)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

