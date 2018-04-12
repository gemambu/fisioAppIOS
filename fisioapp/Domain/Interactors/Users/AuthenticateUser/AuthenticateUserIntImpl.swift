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
                                                let user = self.entityMapper(userData: userData)
                                                onSuccess(user, token)
                                                },
                                              onError: { (msg: String) -> Void in
                                                onError(msg)
                                                })
        
    }
    
    private func entityMapper(userData: UserData) -> User {
        let user = User(
            id: userData.id,
            name: userData.name,
            lastName: userData.lastName,
            email: userData.email,
            isProfessional: userData.isProfessional,
            fellowshipNumber: userData.fellowshipNumber,
            gender: userData.gender,
            address: userData.address,
            phone: userData.phone,
            birthDate: userData.birthDate,
            nationalId: userData.nationalId,
            registrationDate: userData.registrationDate,
            lastLoginDate: userData.lastLoginDate
        )
        
        return user
    }
    
}
