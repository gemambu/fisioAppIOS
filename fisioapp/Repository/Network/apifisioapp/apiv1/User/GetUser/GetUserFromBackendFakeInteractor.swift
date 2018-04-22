//
//  GetUserFakeInteractor.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class GetUserFromBackendFakeInteractor: GetUserFromBackendInteractor {

    func execute(token: String, id: String, onSuccess: @escaping (UserData) -> Void, onError: @escaping (String) -> Void) {
        //let allOk = false
        let allOk = true
        
        // connect to the repository
        
        // check response from repository
        if (allOk) {
            let userData = createFakeUser()
            onSuccess(userData)
        } else {
            onError("Error while getting user")
        }
        
    }
    
    func createFakeUser() -> UserData {
        let userData = UserData(id: "47",  name: "ET", lastName: nil, email: "et@invalid.com", isProfessional: nil, fellowshipNumber: nil,  gender: nil, address: "My house", phone: nil, birthDate: nil, nationalId: nil, registrationDate: nil, lastLoginDate: nil)
        return userData
    }
    
}
