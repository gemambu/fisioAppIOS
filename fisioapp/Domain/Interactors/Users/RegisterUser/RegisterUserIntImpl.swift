//
//  RegisterUserIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 12/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class RegisterUserIntImpl: RegisterUserInteractor {
    func execute(name: String, email: String, password: String, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        let repositoryInteractor: RepositoryInteractor = RepositoryIntImpl()
        repositoryInteractor.registerUser(name: name, email: email, password: password,
                                     onSuccess: { (ok: Bool, msg: String) -> Void in
                                        onSuccess(ok, msg)
        },
                                     onError: { (msg: String) -> Void in
                                        onError(msg)
        })
        
    }
}
