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
    
    func registerNewUserToBackEnd ( name: String, email: String, password: String, isProfessional: Bool ){
        
        let registerUserParameters: Parameters = [
            "name" : name,
            "email" : email,
            "password": password,
            "isProfessional" : isProfessional
        ]

        Alamofire.request(kREGISTER_URL, method: .post, parameters: registerUserParameters, encoding: JSONEncoding.default).responseJSON { (response) in
            print("REGISTER")
//            print(response)
            
            if let registerUserJSON = response.result.value{
               
                if let registerUserObject: Dictionary = registerUserJSON as? Dictionary<String, Any>{
                    print(registerUserObject)
                    
                    if let userRegitered: Dictionary = registerUserObject["result"] as? Dictionary<String, Any>{
                        print(" USER REGISTERED")
                        print(userRegitered)
                    }
                }
            }
            
        }
    }
    
    func loginUserToBackEnd (email: String, password: String){
        
        let loginUserParameters: Parameters = [
            "email" : email,
            "password": password
        ]
        
        Alamofire.request(kLOGIN_URL, method: .post, parameters: loginUserParameters, encoding: JSONEncoding.default).responseJSON { (response) in
            print("LOGIN")
            print(response)
            if let loginUserJSON = response.result.value{
                
                if let loginUserObject: Dictionary = loginUserJSON as? Dictionary<String, Any>{
                    print(loginUserObject)
                    
                    if let userLogged: Dictionary = loginUserObject["result"] as? Dictionary<String, Any>{
                        print(" USER LOGED")
                        print(userLogged)
                    }
                }
            }
        }
    }

    
}
