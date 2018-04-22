//
//  DeleteServiceFromBackendInteractor.swift
//  fisioapp
//
//  Created by Carlos on 21/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol DeleteServiceFromBackendInteractor {
    func execute(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
}
