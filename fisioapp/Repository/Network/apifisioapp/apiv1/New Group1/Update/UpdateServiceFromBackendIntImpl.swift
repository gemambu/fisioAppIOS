//
//  UpdateServiceFromBackendIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 21/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import SwiftyJSON

class UpdateServiceFromBackendIntImpl: UpdateServiceFromBackendInteractor {
    func execute(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_SERVICES_SERVER_PATH + "/" + item.databaseID )
        let headers = [ "x-access-token" : token ]
        
        let parameters = [ "name": item.name, "description": item.description, "price": item.price, "isActive": item.isActive ] as [String : Any]
        
        Alamofire.request(urlAPI!, method: .put, headers: headers, parameters: parameters).validate().responseJSON { (response) in
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
