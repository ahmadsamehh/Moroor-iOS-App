//
//  LoginViewController.swift
//  Test
//
//  Created by Ahmad Sameh on 11/30/19.
//  Copyright © 2019 Ahmad Sameh. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var EmailTextFIeld: UITextField!
    
    @IBOutlet weak var PasswordTextFIeld: UITextField!
    
    @IBOutlet weak var LoginBtnO: UIButton!
    
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shapin()
        LoginBtnO.bindToKeyboard()
        
        CustomFirebaseServices.cfs.checkCurrentUser()

    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func LoginBtnAction(_ sender: Any) {

                    login()

    }
    
    
    func login(){
        
        //Validating Inputs
        ErrorLabel.alpha=1
        ErrorLabel.text=validateFields()
 
        var errormessage = validateFields()
        
        if errormessage == "" {
            //inputs are alright
            //Getting Input Credentials
            let email = EmailTextFIeld.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextFIeld.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            CustomFirebaseServices.cfs.login(enteredEmail: email, enteredPassword: password) { (completion) in
                if completion {
                    
                        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeLatest") as! NewHomeViewController
                        self.navigationController?.pushViewController(secondViewController, animated: true)
                    print("completion handler true")
                }else{
                        self.ErrorLabel.text = "Invalid email or Password"
                    print("error in completion handler")
                }
            }
        }
    }
    
    
    func shapin(){
        ErrorLabel.alpha = 0
        //Utilities.styleFilledButton(LoginBtnO)
        Utilities.styleTextField(EmailTextFIeld)
        Utilities.styleTextField(PasswordTextFIeld)
        
        
    }
    
    
    //Validating TextFields Data
    func validateFields() -> String {
        
        
        var errormessage = ""
        
        if
            
                EmailTextFIeld.text?.trimmingCharacters(in: .whitespacesAndNewlines)      == ""   ||
               
                PasswordTextFIeld.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
             
        {
            
            errormessage = "Please check that you used all the fields"
            
        }
        else {

            
            errormessage = ""
            
        }
        
        
        
        
        return errormessage
    }
    
    

}
