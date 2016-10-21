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



class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    let itemVM = ItemViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemVM.populateArray()
        setupUI()
        setupSearchBar()
        
        itemVM.itemArray.asObservable().observeOn(MainScheduler.instance).bindTo(tableView.rx.items(cellIdentifier: "ItemCell", cellType: ItemCell.self)) {
            row, itemModel, cell in
            cell.catLabel.text = itemModel.category.rawValue
            cell.descriptionLabel.text = itemModel.item
            cell.priceLabel.text = itemModel.price
            cell.qtyLabel.text = String(itemModel.qty)

        }
        .addDisposableTo(disposeBag)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- UI Element Relevant Methods
    
    func setupUI() {
        self.title = "Available Items"
        let attributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "Avenir Next", size: 16)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        
    }
 
    func setupSearchBar(){
        searchBar.rx.text.throttle(0.5, scheduler: MainScheduler.instance).distinctUntilChanged().subscribeNext { [unowned self] (query) in
         let newArray =    self.itemVM.itemArray.value.filter{$0.item.contains(query)}
            
        if newArray.count > 0 {
            self.itemVM.itemArray.value = newArray
        }
        else
        {
            self.itemVM.itemArray.value.removeAll()
            self.itemVM.populateArray()
            //self.dismissKeyboard()
            //self.searchBar.text = "Search for item"
        }
            
    }.addDisposableTo(disposeBag)
        
    }
    
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    //MARK:- Action Buttons
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            //print("first segment clicked")
            itemVM.itemArray.value.sort{$0.priceDouble > $1.priceDouble}

        case 1:
            //print("second segment clicked")
            itemVM.itemArray.value.sort{$0.priceDouble < $1.priceDouble}

        default:
            break
        }
    }
    
  //MARK: - Popover Delegate Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popover" {
            let popoverVC = segue.destination as! PopoverViewController
            popoverVC.preferredContentSize = CGSize(width: 200, height: 320)
            
            let popover = popoverVC.popoverPresentationController
            
            if popover != nil
            {
                popover!.delegate = self
                popoverVC.itemVM = self.itemVM
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
   
}


