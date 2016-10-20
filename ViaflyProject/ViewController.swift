//
//  ViewController.swift
//  ViaflyProject
//
//  Created by Phillip English on 10/19/16.
//  Copyright © 2016 Vitki Arts. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    let itemVM = ItemViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemVM.populateArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

