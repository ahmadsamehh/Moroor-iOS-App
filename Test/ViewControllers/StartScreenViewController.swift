//
//  StartScreenViewController.swift
//  Test
//
//  Created by Ahmad Sameh on 11/30/19.
//  Copyright © 2019 Ahmad Sameh. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    @IBOutlet weak var signupBTN: UIButton!
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
      
       Utilities.styleFilledButton(signupBTN)
        Utilities.styleHollowButton(LoginBtn)
    }


}
