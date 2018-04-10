//
//  GetUserIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class GetUserIntImpl: GetUserInteractor {
    func execute(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: (String) -> Void) {
        let repositoryInteractor: RepositoryInteractor = RepositoryFakeInteractor()
        repositoryInteractor.getUser(token: token, id: id,
                                     onSuccess: { (name: String) -> Void in
                                        let user: String = name
                                        onSuccess(user)
                                        },
                                     onError: { (msg: String) -> Void in
                                        onError(msg)
                                        })

    }
}
