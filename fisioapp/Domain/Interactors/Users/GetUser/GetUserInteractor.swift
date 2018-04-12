//
//  GetUserInteractor.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol GetUserInteractor {    
    func execute(token: String, id: String, onSuccess: @escaping (User) -> Void, onError: @escaping (String) -> Void)
}
