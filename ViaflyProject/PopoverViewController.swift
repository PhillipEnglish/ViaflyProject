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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    @IBAction func accessoriesBttnTapped(_ sender: UIButton) {
        itemVM?.populateArray()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(80))  {
            let newArray = self.itemVM?.itemArray.value.filter {$0.category.isAcessories}
            
            self.itemVM?.itemArray.value = newArray!
            self.itemVM?.storageArray = newArray!
            self.dismiss(animated: true, completion: nil)
            
        }

    }
    
    @IBAction func mensBttnTapped(_ sender: UIButton) {
        itemVM?.populateArray()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(80))  {
            let newArray = self.itemVM?.itemArray.value.filter {$0.category.isMens}
            
            self.itemVM?.itemArray.value = newArray!
            self.itemVM?.storageArray = newArray!
            self.dismiss(animated: true, completion: nil)
            
        }


    }
    
    @IBAction func outerwearBttnTapped(_ sender: UIButton) {
        itemVM?.populateArray()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(80))  {
            let newArray = self.itemVM?.itemArray.value.filter {$0.category.isOuterwear}
            
            self.itemVM?.itemArray.value = newArray!
            self.itemVM?.storageArray = newArray!
            self.dismiss(animated: true, completion: nil)
            
        }


    }
    
    @IBAction func womensBttnTapped(_ sender: UIButton) {
        itemVM?.populateArray()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(80))  {
            let newArray = self.itemVM?.itemArray.value.filter {$0.category.isWomens}
            
            self.itemVM?.itemArray.value = newArray!
            self.itemVM?.storageArray = newArray!
            self.dismiss(animated: true, completion: nil)
            
        }

    }
    
    @IBAction func allBttnTapped(_ sender: UIButton) {
      
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
