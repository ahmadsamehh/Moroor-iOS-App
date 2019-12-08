//
//  StartScreenViewController.swift
//  Test
//
//  Created by Ahmad Sameh on 11/30/19.
//  Copyright © 2019 Ahmad Sameh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import ViewAnimator
import SDWebImage

class StartScreenViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var signupBTN: UIButton!
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        if Auth.auth().currentUser != nil {
            // User is signed in.
            // ...
            print(Auth.auth().currentUser?.uid as Any)
            print("user is already signed in")
            print("Kossom el bdan b2a")
            
            let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "home") as! HomeScreenViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
            
        } else {
            // No user is signed in.
            // ...
            print("No User is signed in")
        }
      
        
        
       Utilities.styleFilledButton(signupBTN)
       
        
       Utilities.styleHollowButton(LoginBtn)
        
      

        let animation = AnimationType.random()
        signupBTN.animate(animations: [animation])
        LoginBtn.animate(animations: [animation])
    }


}
