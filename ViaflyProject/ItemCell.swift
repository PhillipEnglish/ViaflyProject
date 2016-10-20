//
//  ItemCell.swift
//  ViaflyProject
//
//  Created by Phillip English on 10/20/16.
//  Copyright © 2016 Vitki Arts. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
