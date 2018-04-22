//
//  UserDefaultsCustomized.swift
//  fisioapp
//
//  Created by Carlos on 22/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class CustomUserDefaults {
    static let userDefault = UserDefaults.standard
    
    static var token: String {
        get {
            let token = userDefault.string(forKey: "token")
            print("//-----\nGet token: \(String(describing: token))\n-----//")
            return token ?? ""
        }
        set(token) {
            print("//-----\nSet token - before: \(String(describing: token))\n-----//")
            userDefault.set(token, forKey: "token")
            print("//-----\nSet token - after: \(String(describing: token))\n-----//")
        }
    }
    
    static var userId: String {
        get {
            let userId = userDefault.string(forKey: "userId")
            print("//-----\nSet userId: \(String(describing: userId))\n-----//")
            return userId ?? ""
        }
        set(userId) {
            print("//-----\nSet userId - before: \(String(describing: userId))\n-----//")
            userDefault.set(token, forKey: "userId")
            print("//-----\nSet userId - after: \(String(describing: userId))\n-----//")
        }
    }

    static func checkToken() -> Bool {
        return token.count != 0
    }
}
