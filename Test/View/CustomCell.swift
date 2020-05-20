//
//  CustomCell.swift
//  Test
//
//  Created by Ahmad Sameh on 5/4/20.
//  Copyright © 2020 Ahmad Sameh. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var fineLocation : UILabel!
    @IBOutlet weak var fineTime : UILabel!
    
    func updateCellViews(fineLocation : String , fineTime : String){
        
        self.fineLocation.text = fineLocation
        self.fineTime.text = fineTime
        
    }

}
