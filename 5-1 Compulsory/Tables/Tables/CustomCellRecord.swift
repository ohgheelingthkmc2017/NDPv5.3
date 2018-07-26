//
//  CustomCellRecord.swift
//  Tables
//
//  Created by Oh Ghee Ling on 18/7/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

class CustomCellRecord: UITableViewCell {
    
   
    @IBOutlet weak var databaseLabel: UILabel!
    
    @IBOutlet weak var length: UILabel!
    
    @IBOutlet weak var recordImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
