//
//  CurrentUserClass.swift
//  Test
//
//  Created by Ahmad Sameh on 4/30/20.
//  Copyright © 2020 Ahmad Sameh. All rights reserved.
//

import Foundation
class CurrentUser {
    
    static let instance = CurrentUser()
    
    let currentUserFine = fine(finesCount: 0, finesLocationsArray: [""], finesTimesArray: [""])
    var currentUser = User(firstName: "", lastName: "", email: "", phoneNumber: "", plateNumber: "", userFine: CurrentUser.instance.currentUserFine)
    
    
    
    func setCurrentUser(currentUser : User) {
        self.currentUser = currentUser
    }
    
    
    
}
