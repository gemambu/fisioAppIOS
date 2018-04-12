//
//  RegisterUserIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 12/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import SwiftyJSON

class RegisterUserInBackendIntImpl: RegisterUserInBackendInteractor {
    
    func execute(name: String, email: String, password: String, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_USERS_REGISTER_SERVER_PATH)
        let parameters = [ "name": name, "email": email, "password": password ]
        let headers = [ "Content-Type": "application/x-www-form-urlencoded" ]
        
        Alamofire.request(urlAPI!,method: .post, parameters: parameters, headers: headers).responseJSON { (response) in
            print("Response: \(response)")
            switch response.result{
                case .success:
                    if let value = response.data {
                        let json = JSON(data: value)
                        let ok = json["ok"].bool ?? false
                        var msg = json["message"].string ?? ""
                        if (msg == "") {
                            msg = json["error"]["message"].string ?? ""
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
