//
//  GetUserInteractor.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol GetUserFromBackendInteractor {
    func execute(token: String, id: String, onSuccess: @escaping (UserData) -> Void, onError: @escaping (String) -> Void)
}
