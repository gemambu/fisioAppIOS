//
//  GetCatalogItemsFromBackEndIntImpl.swift
//  fisioapp
//
//  Created by Gema Martinez on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetCatalogItemsFromBackEndIntImpl: GetCatalogItemsFromBackEndInteractor {
    
    func execute(token: String, type: String, onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void) {
        
        var urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_SERVICES_SERVER_PATH)
        if(type == "PRODUCTS"){
            urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_PRODUCTS_SERVER_PATH)
        }
        
        let headers = [ "x-access-token" : token ]
        let queryParams: Parameters = [:]
        
        Alamofire.request(urlAPI!, method: .get, parameters: queryParams, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            //print("\(urlAPI) : \(queryParams)")
            //print(response.request)
            switch response.result{
            case .success:
                if let value = response.data {
                    let json = JSON(data: value)
                    
                    var itemsFromJson = [CatalogData]()
                    
                    let rows = json["result"]["rows"].arrayValue
                    
                    for item in rows {
                        
                        let itemParsed = CatalogData(
                            databaseID: item["_id"].stringValue,
                            name: item["name"].stringValue,
                            description: item["description"].stringValue,
                            price: item["price"].floatValue,
                            professional: UserData(
                                id: item["professional"]["_id"].stringValue,
                                name: item["professional"]["name"].stringValue,
                                lastName: item["professional"]["lastName"].stringValue),
                            isActive: item["isActive"].intValue,
                            type: type)
                        
                        itemsFromJson.append(itemParsed)
                    }
                    
                    onSuccess(itemsFromJson)
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
