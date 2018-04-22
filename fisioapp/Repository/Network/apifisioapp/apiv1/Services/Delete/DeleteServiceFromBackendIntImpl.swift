//
//  DeleteServiceFromBackendIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 21/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DeleteServiceFromBackendIntImpl: DeleteServiceFromBackendInteractor {
    func execute(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_SERVICES_SERVER_PATH + "/" + id)
        let headers = [ "x-access-token" : token ]
        
        Alamofire.request(urlAPI!, method: .delete, headers: headers).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.data {
                    let json = JSON(data: value)
                    let message = json["message"].string ?? ""
                    onSuccess(message)
                    
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

