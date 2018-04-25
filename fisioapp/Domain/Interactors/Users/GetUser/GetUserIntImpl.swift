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
                                        let user = convert(user: userData)
                                        onSuccess(user)
                                        },
                                     onError: { (msg: String) -> Void in
                                        onError(msg)
                                        })

    }


}
