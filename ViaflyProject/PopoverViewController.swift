//
//  PopoverViewController.swift
//  ViaflyProject
//
//  Created by Phillip English on 10/20/16.
//  Copyright © 2016 Vitki Arts. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    
    var itemVM: ItemViewModel?
    var itemArrayHolder: [ItemModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        itemVM?.populateArray()
        itemArrayHolder = (itemVM?.itemArray.value)!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func actionHelper()
    {
       // itemVM?.itemArray.value.removeAll()
        itemVM?.itemArray.value = itemArrayHolder
        //itemVM?.populateArray()
        

    }
    
    @IBAction func accessoriesBttnTapped(_ sender: UIButton) {
        actionHelper()
        let newArray = itemVM?.itemArray.value.filter {$0.category.isAcessories}
        itemVM?.itemArray.value = newArray!
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mensBttnTapped(_ sender: UIButton) {
        actionHelper()
        let newArray = itemVM?.itemArray.value.filter {$0.category.isMens}
        itemVM?.itemArray.value = newArray!
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func outerwearBttnTapped(_ sender: UIButton) {
        actionHelper()
        let newArray = itemVM?.itemArray.value.filter {$0.category.isOuterwear}
        itemVM?.itemArray.value = newArray!
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func womensBttnTapped(_ sender: UIButton) {
        actionHelper()
        let newArray =   itemVM?.itemArray.value.filter {$0.category.isWomens}
        itemVM?.itemArray.value = newArray!
        
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func allBttnTapped(_ sender: UIButton) {
        //actionHelper()
        itemVM?.itemArray.value.removeAll()
        itemVM?.populateArray()
        self.dismiss(animated: true, completion: nil)

    }
  
}



extension ItemCategory {
    var isAcessories : Bool{
        switch self{
        case .accessories : return true
        default : return false
        }
    }
    
    var isMens : Bool{
        switch self{
        case .mens : return true
        default : return false
        }
    }
    
    var isOuterwear : Bool{
        switch self{
        case .outerwear : return true
        default : return false
        }
    }
    
    var isWomens : Bool{
        switch self{
        case .womens: return true
        default : return false
        }
}
}
