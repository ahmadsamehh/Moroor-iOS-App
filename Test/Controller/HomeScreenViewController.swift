//
//  HomeScreenViewController.swift
//  Test
//
//  Created by Ahmad Sameh on 11/30/19.
//  Copyright © 2019 Ahmad Sameh. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseAuth

class HomeScreenViewController: UIViewController {
    @IBOutlet weak var plateNumLabel: UILabel!
    @IBOutlet weak var PhoneNumLabel: UILabel!
    @IBOutlet weak var finesCountLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    

    let f = FinesData()

    override func viewDidLoad() {
        super.viewDidLoad()

        let UID = Auth.auth().currentUser!.uid
        let db = Firestore.firestore()

        db.collection("Users").document(UID).addSnapshotListener { (data, error) in
          
            if error != nil {
                
                print("error retriving data!")
            }else {
                
                let fname = data!.get("First_Name") as! String
                let sname = data!.get("Last_Name") as! String

                self.nameLabel.text = "\(fname) \(sname)"
                print("\(fname) \(sname)")
                self.emailLabel.text = data?.get("Email") as? String
                self.PhoneNumLabel.text = data?.get("Phone_Number") as? String
                self.plateNumLabel.text = data?.get("Plate_Number") as? String
                
                self.finesCountLabel.text = data?.get("fines_count") as? String

//                self.myTableVC.finesCount = Int( data!.get("fines_count") as! String)!
              
                self.f.finesCount = Int(data!.get("fines_count") as! String)!
                self.f.finesLocationArray = (data!.get("fines_location_array") as! [String]?)!
                self.f.finesTimesArray = (data!.get("fines_time") as! [String]?)!
                
            }
            
        }
        
  
        
        
        
    }

    @IBAction func ShowFinesBtn(_ sender: Any) {
        
//        // the name for UIStoryboard is the file name of the storyboard without the .storyboard extension
        let vc : TableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
      //  vc.finesCount = Int(finesCountLabel.text!)!

        vc.finesCount = f.finesCount
        vc.fines_location_array = f.finesLocationArray
        vc.fines_time_array = f.finesTimesArray
       self.navigationController?.pushViewController(vc, animated: true)
       //self.present(vc, animated: true, completion: nil)
        
        
       

    }
    
}
