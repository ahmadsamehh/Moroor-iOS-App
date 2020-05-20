//
//  CustomBtn.swift
//  Test
//
//  Created by Ahmad Sameh on 4/30/20.
//  Copyright © 2020 Ahmad Sameh. All rights reserved.
//

import UIKit

class CustomBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 0.5
        
    }

}
