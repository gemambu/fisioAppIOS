//
//  RepositoryFakeInteractor.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class RepositoryFakeInteractor: RepositoryInteractor {
    
    /******** users ********/
    func authenticateUser(email: String, password: String, onSuccess: @escaping (UserData, String) -> Void, onError: @escaping (String) -> Void) {
        //let allOk = false
        let allOk = true
        
        // connect to the repository
        
        // check response from repository
        if (allOk) {
            let userData = createFakeUser()
            let token = createFakeToken()
            onSuccess(userData, token)
        } else {
            onError("Error while authenticating user")
        }
        
    }
    
    func getUser(token: String, id: String, onSuccess: @escaping (UserData) -> Void, onError: @escaping (String) -> Void) {
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
    
    func registerUser(name: String, email: String, password: String, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        //let allOk = false
        let allOk = true
        
        // connect to the repository
        
        // check response from repository
        if (allOk) {
            let ok = allOk
            let msg = "user created"
            onSuccess(ok, msg)
        } else {
            onError("Error while authenticating user")
        }
        
    }

    func createFakeUser() -> UserData {
        let userData = UserData(
            id: "33",
            name: "name",
            lastName: "lastName",
            email: "email",
            isProfessional: true,
            fellowshipNumber: "fellowshipNumber",
            gender: "gender",
            address: "address",
            phone: "phone",
            birthDate: Date(),
            nationalId: "nationalId",
            registrationDate: "registrationDate",
            lastLoginDate: "lastLoginDate")
        return userData
    }

    func createFakeToken() -> String {
        let token = "FakeToken.1234567890"
        return token
    }
    
    /******** appointments ********/
    func getAppointmentsForDate(token: String, date: String, onSuccess: @escaping ([AppointmentData]) -> Void, onError: @escaping (String) -> Void) {}

}
