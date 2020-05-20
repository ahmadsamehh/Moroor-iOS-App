//
//  TableViewCell.swift
//  Test
//
//  Created by Ahmad Sameh on 12/8/19.
//  Copyright © 2019 Ahmad Sameh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var FinePlaceLabel: UILabel!
    
    @IBOutlet weak var FineTimeLabel: UILabel!
    
    
    @IBOutlet weak var PayFineBtn: UIButton!
    
    
    
    @IBAction func PayFineBtnAction(_ sender: Any) {
        print("Btn is Pressed")
    
        FineTimeLabel.text = "eddey gamed"
    }
    
}
