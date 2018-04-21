//
//  DomainUserProfileImplementation.swift
//  fisioapp
//
//  Created by Alan Casas on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation


class DomainUserProfileImplementation : DomainUserProfileInteractor {
    func execute(name: String, lastname: String?, email: String, address: String?, phone: String?, birthdate: String?, nationalId: String?, gender: String?, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        let respositoryInteractor: RepositoryUserProfileInteractor = RepositoryUserProfileImplementation()
        
        respositoryInteractor.execute(name: name, lastname: lastname, email: email, address: address, phone: phone, birthdate: birthdate, nationalId: nationalId, gender: gender, onSuccess: { (success, message) in
            
            onSuccess(success, message)
            
        }) { (message) in
            onError(message)
        }
    }
    
}
