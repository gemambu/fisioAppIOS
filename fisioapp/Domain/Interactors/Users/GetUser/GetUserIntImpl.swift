//
//  GetUserIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class GetUserIntImpl: GetUserInteractor {
    func execute(token: String, id: String, onSuccess: @escaping (User) -> Void, onError: @escaping (String) -> Void) {
        let repositoryInteractor: RepositoryInteractor = RepositoryIntImpl()
        repositoryInteractor.getUser(token: token, id: id,
                                     onSuccess: { (userData: UserData) -> Void in
                                        let user = self.entityMapper(userData: userData)
                                        onSuccess(user)
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
