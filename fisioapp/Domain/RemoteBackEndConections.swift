//
//  RemoteBackEndConections.swift
//  fisioapp
//
//  Created by Alan Casas on 12/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RemoteBackEndConections{
    
    let parameters: Parameters = [
        "name" : "Alan",
        "email" : "alan123@test.com",
        "password" : "123456",
        "isProfessional" : false
    ]

    func registerNewUserToBackEnd (){
        
        Alamofire.request(kREGISTER_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            print("REGISTER")
            print(response)
        }
    }
    
    func loginUserToBackEnd (){
        
        Alamofire.request(kLOGIN_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            print("LOGIN")
            print(response)
        }
    }

    
}
