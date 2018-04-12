//
//  GetUserIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetUserFromBackendIntImpl: GetUserFromBackendInteractor {

    func execute(token: String, id: String, onSuccess: @escaping (UserData) -> Void, onError: @escaping (String) -> Void) {
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_USER_SERVER_PATH + "/" + id)
        let headers = [ "x-access-token" : token ]
        
        Alamofire.request(urlAPI!, method: .get, headers: headers).validate().responseJSON { (response) in
            switch response.result{
                case .success:
                    if let value = response.data {
                        let json = JSON(data: value)
                        let id = json["result"]["_id"].string ?? ""
                        let name = json["result"]["name"].string ?? ""
                        let lastName = json["result"]["lastName"].string ?? ""
                        let email = json["result"]["email"].string ?? ""
                        let isProfessional = (json["result"]["isProfessional"].bool)!
                        let fellowshipNumber = json["result"]["fellowshipNumber"].string ?? ""
                        let gender = json["result"]["gender"].string ?? ""
                        let address = json["result"]["address"].string ?? ""
                        let phone = json["result"]["phone"].string ?? ""
                        let birthDate = json["result"]["birthDate"].date
                        let nationalId = json["result"]["nationalId"].string ?? ""
                        let registrationDate = json["result"]["registrationDate"].string ?? ""
                        let lastLoginDate = json["result"]["lastLoginDate"].string ?? ""
                        
                        let userData = UserData(id: id, name: name, lastName: lastName, email: email, isProfessional: isProfessional, fellowshipNumber: fellowshipNumber, gender: gender, address: address, phone: phone, birthDate: birthDate, nationalId: nationalId, registrationDate: registrationDate, lastLoginDate: lastLoginDate)
                        onSuccess(userData)

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
