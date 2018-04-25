//
//  AuthenticateUserIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 12/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class AuthenticateUserIntImpl: AuthenticateUserInteractor {
    func execute(email: String, password: String,
                 onSuccess: @escaping (User, String) -> Void, onError: @escaping (String) -> Void) {
        let repositoryInteractor: RepositoryInteractor = RepositoryIntImpl()
        repositoryInteractor.authenticateUser(email: email, password: password,
                                              onSuccess: { (userData: UserData, token: String) -> Void in
                                                let user = convert(user: userData)
                                                onSuccess(user, token)
                                                },
                                              onError: { (msg: String) -> Void in
                                                onError(msg)
                                                })
        
    }
    
    
}
