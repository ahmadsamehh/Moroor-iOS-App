//
//  CustomView.swift
//  Test
//
//  Created by Ahmad Sameh on 5/17/20.
//  Copyright © 2020 Ahmad Sameh. All rights reserved.
//

import UIKit

class CustomView: UIView {

 override func awakeFromNib() {
     super.awakeFromNib()
     layer.cornerRadius = 10
    layer.shadowRadius = 10
    layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
 }

}
