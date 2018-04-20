//
//  DomainUserProfileInteractor.swift
//  fisioapp
//
//  Created by Alan Casas on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

protocol DomainUserProfileInteractor {
    func execute(name: String, lastname: String?, email: String, address: String?, phone: String?, birthdate: String?, nationalId: String?, gender: String?, image: UIImage, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void)
}


