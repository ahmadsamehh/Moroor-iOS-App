//
//  UserDataViewController.swift
//  Test
//
//  Created by Ahmad Sameh on 11/27/19.
//  Copyright © 2019 Ahmad Sameh. All rights reserved.
//

import UIKit
import Firebase

class UserDataViewController: UIViewController {

    @IBOutlet weak var FinesTotalEGP: UILabel!
    @IBOutlet weak var FinesLabel: UILabel!
    @IBOutlet weak var CarPlateNumLabel: NSLayoutConstraint!
    @IBOutlet weak var CarOwnerNameLabel: UILabel!
    
    var carownerName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let db = Firestore.firestore()

        
        db.collection("Users")
            .document("909090")
            .getDocument { (document, error) in
                
                // Check for error
                if error == nil {
                    
                    // Check that this document exists
                    if document != nil && document!.exists {
                        
                        let documentData = document!.data()
                        print(documentData!)
                        
                    }
                    
                }
                
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
