//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        textfield.borderStyle = .roundedRect
        textfield.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textfield.layer.borderWidth = 1
        textfield.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textfield.layer.cornerRadius = 10
        
        
        // Create the bottom line
      //  let bottomLine = CALayer()
        
//        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 1, width:textfield.frame.width - 80 , height: 1)
//
//        bottomLine.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        // Remove border on text field
//        textfield.borderStyle = .line
//
//        textfield.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//        // Add the line to the text field
//        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 90/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        button.bindToKeyboard()
        
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
        button.bindToKeyboard()
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
