//
//  AuthenticateUserIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 12/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import SwiftyJSON

class AuthenticateUserInBackendIntImpl: AuthenticateUserInBackendInteractor {
    
    func execute(email: String, password: String, onSuccess: @escaping (UserData, String) -> Void, onError: @escaping (String) -> Void) {
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_USERS_AUTHENTICATE_SERVER_PATH)
        let parameters = [ "email": email, "password": password ]
        let headers = [ "Content-Type": "application/x-www-form-urlencoded" ]
        
        Alamofire.request(urlAPI!,method: .post, parameters: parameters, headers: headers).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.data {
                    let json = JSON(data: value)
                    let id = json["result"]["_id"].string ?? ""
                    let name = json["result"]["name"].string ?? ""
                    let lastName = json["result"]["lastName"].string ?? ""
                    let email = json["result"]["email"].string ?? ""
                    let isProfessional = (json["result"]["isProfessional"].bool) ?? false
                    let fellowshipNumber = json["result"]["fellowshipNumber"].string ?? ""
                    let gender = json["result"]["gender"].string ?? ""
                    let address = json["result"]["address"].string ?? ""
                    let phone = json["result"]["phone"].string ?? ""
                    let birthDate = json["result"]["birthDate"].date
                    let nationalId = json["result"]["nationalId"].string ?? ""
                    let registrationDate = json["result"]["registrationDate"].string ?? ""
                    let lastLoginDate = json["result"]["lastLoginDate"].string ?? ""
                    let image = json["result"]["user"]["img"]
                    
                    let userData = UserData(id: id, name: name, lastName: lastName, email: email, isProfessional: isProfessional, fellowshipNumber: fellowshipNumber, gender: gender, address: address, phone: phone, birthDate: birthDate, nationalId: nationalId, registrationDate: registrationDate, lastLoginDate: lastLoginDate)
                    
                    let token = json["result"]["token"].string ?? ""
                    let userId = json["result"]["user"]["_id"].string ?? ""
                    print(json["result"])

                    let defaults = UserDefaults.standard
                    
                    defaults.set(token, forKey: "token")
                    defaults.set(userId, forKey: "userId")
                    
                    onSuccess(userData, token)

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
