//
//  RegisterUserInteractor.swift
//  fisioapp
//
//  Created by Carlos on 12/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol RegisterUserInteractor {
    func execute(name: String, email: String, password: String, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void)
}
