//
//  InsertServiceFromBackendIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 22/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class InsertServiceFromBackendIntImpl: InsertServiceFromBackendInteractor {
    func execute(token: String, item: CatalogData, onSuccess: @escaping (CatalogData) -> Void, onError: @escaping (String) -> Void) {
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_SERVICES_SERVER_PATH )
        let headers = [ "x-access-token" : token, "Content-Type": "application/x-www-form-urlencoded" ]
        
        let parameters = [ "name": item.name, "description": item.description, "price": item.price, "isActive": item.isActive ] as [String : Any]
        
        Alamofire.request(urlAPI!, method: .post, parameters: parameters, headers: headers).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.data {
                    let json = JSON(data: value)
                    let id = json["result"]["_id"].string ?? ""
                    let name = json["result"]["name"].string ?? ""
                    let description = json["result"]["description"].string ?? ""
                    let price = json["result"]["price"].float ?? Float(0)
                    let isActive = json["result"]["isActive"].int ?? 0
                    let _ = json["message"].string ?? ""
                    
                    let professionalId = (json["result"]["professional"].string)!
                    let professional = UserData(id: professionalId, name: "fakeName", lastName: "fakeLastname")
                    
                    let  catalogData = CatalogData(databaseID: id, name: name, description: description, price: price, professional: professional, isActive: isActive, type: "SERVICE")
                    onSuccess(catalogData)
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
