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
    func getUser(token: String, id: String, onSuccess: (String) -> Void, onError: (String) -> Void) {
        //let allOk = false
        let allOk = true

        // connect to the repository

        // check response from repository
        if (allOk) {
            let user = createFakeUser()
            onSuccess(user)
        } else {
            onError("Error while getting user")
        }

    }

    func createFakeUser() -> String {
        let user = "My Name"
        return user
    }

}
