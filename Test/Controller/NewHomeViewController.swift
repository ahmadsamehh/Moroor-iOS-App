//
//  NewHomeViewController.swift
//  Test
//
//  Created by Ahmad Sameh on 12/10/19.
//  Copyright © 2019 Ahmad Sameh. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseAuth
import Toast_Swift

class NewHomeViewController: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var PlateNumberLabel: UILabel!
    @IBOutlet weak var PhoneNumberLabel: UILabel!
    @IBOutlet weak var FinesCountLabel: UILabel!
    @IBOutlet weak var editInfoBtnOutlet: UIButton!
    @IBOutlet weak var logoutBtnOutlet: UIButton!
    @IBOutlet weak var finesInfoBtnOutlet: UIButton!
    @IBOutlet weak var FinesTotalLabel: UILabel!
    
    let f = FinesData()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // reshaping the buttons
//        Utilities.styleFilledButton(editInfoBtnOutlet)
  //      Utilities.styleFilledButton(logoutBtnOutlet)
    //    Utilities.styleFilledButton(finesInfoBtnOutlet)
        
        let UID = Auth.auth().currentUser!.uid
        let db = Firestore.firestore()
        
        db.collection("Users").document(UID).addSnapshotListener { (data, error) in
            
            if error != nil {
                
                print("error retriving data!")
            }else {
                
                let fname = data!.get("First_Name") as! String
                let sname = data!.get("Last_Name") as! String
                let p = data!.get("Plate_Number") as! String
                
                self.NameLabel.text = "\(fname) \(sname)"
                print("\(fname) \(sname)")
                self.EmailLabel.text = data?.get("Email") as? String
                self.PhoneNumberLabel.text = data?.get("Phone_Number") as? String
                self.PlateNumberLabel.text = data?.get("Plate_Number") as? String
                print("\(p)")
                self.FinesCountLabel.text = data?.get("fines_count") as? String
                self.FinesCountLabel.text = data?.get("fines_count") as? String
                self.FinesTotalLabel.text = "\(String(Int((data?.get("fines_count") as? String)!)!*150)) EGP"
           //     self.FinesTotalLabel.text = "\(String(Int((self.FinesCountLabel.text as? String)!)!*150)) EGP"
                
                
                //                self.myTableVC.finesCount = Int( data!.get("fines_count") as! String)!
//
                self.f.finesCount = Int(data!.get("fines_count") as! String)!
                self.f.finesLocationArray = (data!.get("fines_location_array") as! [String]?)!
              //  self.f.finesTimesArray = (data!.get("fines_time") as! [String]?)!
                self.f.finesTimesArray = ((data!.get("fines_time")) as! [String]?)!

            }
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    //Btn Actions
    @IBAction func EditInfoBtnAction(_ sender: Any) {
    }
    
    
    @IBAction func LogoutBtnAction(_ sender: Any) {
        
        do
        {
            try Auth.auth().signOut()
//              let vc : StartScreenViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StartScreen") as! StartScreenViewController
//            self.view.makeToast("Signed out succesfully", duration:3.0 , position:.bottom)
            self.navigationController?.popViewController(animated: true)
           

            
        }
        catch let error as NSError
        {
            print (error.localizedDescription)
        }
        
    }
    
    
    @IBAction func FinesInfoBtnAction(_ sender: Any) {
        
        //        // the name for UIStoryboard is the file name of the storyboard without the .storyboard extension
        let vc : FinesTableVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "finesVC") as! FinesTableVC
        //  vc.finesCount = Int(finesCountLabel.text!)!
        
        vc.finesCount = f.finesCount
        vc.fines_location_array = f.finesLocationArray
        vc.fines_time_array = f.finesTimesArray
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true, completion: nil)
        
        
        
    }
    
}
