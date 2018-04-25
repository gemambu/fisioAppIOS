//
//  UpdateAppointmentInBackEndIntImpl.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UpdateAppointmentInBackEndIntImpl: UpdateAppointmentInBackEndInteractor {
    func execute(token: String, id: String, isConfirmed: Bool, isCancelled: Bool, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_APPOINTMENTS_SERVER_PATH + "/" + id)
        let headers: HTTPHeaders = [ "x-access-token" : token, "Content-Type": "application/x-www-form-urlencoded" ]
        let parameters = ["isConfirmed": isConfirmed, "isCancelled": isCancelled] as [String : Any]
        
        Alamofire.request(urlAPI!, method: .put, parameters: parameters, headers: headers).validate().responseJSON { (response) in
            print(response.request?.url)
            
            switch response.result {
            case .success:
                if let value = response.data {
                    let json = JSON(data: value)
                    let ok = json ["ok"].bool ?? false
                    var msg = json["result"].string ?? ""
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
