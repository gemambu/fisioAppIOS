//
//  User.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

public class User {
    
    var id: String = ""
    var name: String = ""
    var lastName: String = ""
    var email: String = ""
    var isProfessional: Bool = false
    var fellowshipNumber: String = ""
    var gender: String = ""
    var address: String = ""
    var phone: String = ""
    var birthDate: Date? = nil
    var nationalId: String = ""
    var registrationDate: String = ""
    var lastLoginDate: String = ""
    
    public init (id: String, name: String, lastName: String?, email: String, isProfessional: Bool?, fellowshipNumber: String?, gender: String?, address: String?, phone: String?, birthDate: Date?, nationalId: String?, registrationDate: String?, lastLoginDate: String?) {
        self.id = id
        self.name = name
        self.lastName = lastName ?? ""
        self.email = email
        self.isProfessional = isProfessional ?? false
        self.fellowshipNumber = fellowshipNumber ?? ""
        self.gender = gender ?? ""
        self.address = address ?? ""
        self.phone = phone ?? ""
        self.birthDate = birthDate ?? nil
        self.nationalId = nationalId ?? ""
        self.registrationDate = registrationDate ?? ""
        self.lastLoginDate = lastLoginDate ?? ""
    }
    
}
