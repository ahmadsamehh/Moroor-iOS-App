//
//  SignUpViewController.swift
//  Test
//
//  Created by Ahmad Sameh on 11/30/19.
//  Copyright © 2019 Ahmad Sameh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
   
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    
    @IBOutlet weak var SecondNameTextField: UITextField!
    
    @IBOutlet weak var PlateNumberTextNumber: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var Pass1TextField: UITextField!
    
    @IBOutlet weak var Pass2TextField: UITextField!
    
    @IBOutlet weak var PhoneNumTextField: UITextField!
    @IBOutlet weak var SignUpBtnO: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shaping()
        
    }

    
    @IBAction func SignUpBtnAction(_ sender: Any) {
        
        //Showing the label plus the usrer's error message.
        ErrorLabel.alpha=1
        ErrorLabel.text = validateFields()
        
        
        //Starting the signup process.
        var errormessage = validateFields()
        
        
        if errormessage == ""{
            //Checking is complete and everything is fine , we will start the signup process.
            print("Signup smooth")
            
        
            //Getting The values from the text Field
            let firstName = FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = SecondNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let PhoneNumber = PhoneNumTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let PlateNumber = PlateNumberTextNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = Pass1TextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            //Starting Firebase Auth
            Auth.auth().createUser(withEmail: email, password: password) { (authresult, autherror) in
                
                
                if autherror != nil{
                    
                    self.ErrorLabel.text = "Error Signing up"
                    
                }else{
                    
                    
                    let db = Firestore.firestore()
                    
                    db.collection("Users").document((authresult?.user.uid)!).setData(["First_Name":firstName ,
                                                                          "Last_Name":lastName ,
                                                                          "Email":email,
                                                                          "Phone_Number":PhoneNumber,
                                                                          "Plate_Number":PlateNumber,
                                                                          "UID":authresult?.user.uid], merge: true){
                                                                            (error) in
                                                                            
                                                                            if error != nil {
                                                                                // Show error message
                                                                                self.ErrorLabel.text="error creating user , please try again."
                                                                            }
                                                                            
                                                                            
                                                                            
                    }
                
                    
                    self.ErrorLabel.text="Signup is successful !"
                    
                    
                }
                    
                    
                    
                    
                }
                
                
                
            
            
            
            
        }else{
            
            print("Problem signing up")
        }
        
        
        
        
        
        
        
        
        
        
        
        
    print("Signup button is pressed")
    }
    
    
    
    
    
    
    
    func shaping(){
        
        ErrorLabel.alpha = 0
        Utilities.styleTextField(FirstNameTextField)
        Utilities.styleTextField(SecondNameTextField)
        Utilities.styleTextField(PlateNumberTextNumber)
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(PhoneNumTextField)
        Utilities.styleTextField(Pass1TextField)
        Utilities.styleTextField(Pass2TextField)
        Utilities.styleFilledButton(SignUpBtnO)
        
        
    }
    
    
    //Validating TextFields Data
    func validateFields() -> String {
        
        
         var errormessage = ""
        
        if
        FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""    ||
        SecondNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""   ||
        EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)      == ""   ||
        PhoneNumTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)   == ""   ||
        PlateNumberTextNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        Pass1TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""        ||
        Pass2TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
          errormessage = "Please check that you used all the fields"
            
        }
        else {
            
            if Pass1TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == Pass2TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
                
                
            }else{
                
                errormessage = "Please double check your password fields"
            }
            
           
            
        }
        
        
        
        
        return errormessage
    }
    
    

}
