//
//  RepositoryUserProfileImplementation.swift
//  fisioapp
//
//  Created by Alan Casas on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RepositoryUserProfileImplementation : RepositoryUserProfileInteractor {

    let defaults = UserDefaults.standard
    
    func execute(name: String, lastname: String?, email: String, address: String?, phone: String?, birthdate: String?, nationalId: String?, gender: String?, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        
        let token = defaults.string(forKey: "token")
        let userId = defaults.string(forKey: "userId")
        
        let headers: HTTPHeaders = [
            "x-access-token": token!,
            "Content-type": "multipart/form-data"
        ]
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_USERS_UPDATE_SERVER_PATH + "/" + userId! )
        
        let parameters = [
            "name": name,
            "lastname": lastname!,
            "email": email,
            "address": address!,
            "phone" : phone!,
            "birthdate": birthdate!,
            "nationalId": nationalId!,
            "gender": gender!
            ] as [String : Any]
        
        
        Alamofire.request(urlAPI!,method: .put, parameters: parameters, headers: headers).responseJSON { (response) in
            print("Response: \(response)")
            switch response.result{
            case .success:
                if let value = response.data {
                    let json = JSON(data: value)
                    let ok = json["ok"].bool ?? false
                    var msg = json["message"].string ?? ""
                    if (msg == "") {
//                        let errors = json["error"]["err"]["errors"].array
//                        errors!.forEach({ (json) in
//                            var jsonArray = json["message"].string
//                            print(jsonArray!)
//                            msg.append(jsonArray!)
//                        })
                    }
                    
                    onSuccess(ok, msg)
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                onError(error.localizedDescription)
                break
                
            }
        }

    }
    
    
}

