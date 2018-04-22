//
//  AuthenticateUserInteractor.swift
//  fisioapp
//
//  Created by Carlos on 12/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol AuthenticateUserInBackendInteractor {
    func execute(email: String, password: String, onSuccess: @escaping (UserData, String) -> Void, onError: @escaping (String) -> Void)
}
