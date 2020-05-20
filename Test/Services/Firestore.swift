//
//  Firestore.swift
//  Test
//
//  Created by Ahmad Sameh on 4/30/20.
//  Copyright © 2020 Ahmad Sameh. All rights reserved.
//

import Foundation
import Firebase
class CustomFirebaseServices{
    
    static let cfs = CustomFirebaseServices()
    
    let db = Firestore.firestore()
    
    func checkCurrentUser(){
        
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
            // ...
            
        } else {
            // No user is signed in.
            // ...
            print("No User is signed in")
        }
        
    }

    func login(enteredEmail : String , enteredPassword : String , completion : @escaping (_ complete : Bool)-> Void){
        var email = enteredEmail
        var password = enteredPassword
        var errorText = ""

        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                errorText =  error!.localizedDescription
                print(errorText)
                completion(false)
                
            }else{
                errorText = ""
                completion(true)
                
            }
            
            
        }
        
    }
    
    func signUp(enteredEmail : String, enteredPassword : String , completion : (_ complter : Bool) -> Void){
        
        var email = enteredEmail
        var password = enteredPassword
        var errorText = ""
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, authError) in
            if authError != nil{
                
                print("error in firebase signup function")
            }else{
                
                let currentUser = CurrentUser.instance.currentUser
                self.db.collection("Users").document((authResult?.user.uid)!).setData(["First_Name":currentUser.firstName ,
                                                                                  "Last_Name":currentUser.lastName ,
                                                                                  "Email":currentUser.email,
                                                                                  "Phone_Number":currentUser.phoneNumber,
                                                                                  "Plate_Number":currentUser.plateNumber,
                                                                                  "UID":authResult?.user.uid,
                                                                                  "fines_location_array":currentUser.userFine.finesLocationsArray,
                                                                                  "fines_time":currentUser.userFine.finesTimesArray,
                                                                                  "fines_count":"0"
                    ],
                                                                                 merge: true){
                                                                                    (error) in
                                                                                    
                                                                                    if error != nil {
                                                                                        // Show error message
                                                                                        print("error creating user , please try again.")
                                                                                    }
                                                                                    
                                                                                    
                                                                                    
                }
                
                
                
            }
        }
        
        
        
        
        
        
    }
    
    func logout(){}
    
}




