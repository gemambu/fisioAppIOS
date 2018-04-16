//
//  GetAppointmentsFromBackEndIntImpl.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 14/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetAppointmentsForDateFromBackEndIntImpl: GetAppointmentsForDateFromBackEndInteractor {
    func execute(token: String, date: String, onSuccess: @escaping ([AppointmentData]) -> Void, onError: @escaping (String) -> Void) {
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_APPOINTMENTS_PROFESSIONAL_SERVER_PATH)
        let headers = [ "x-access-token" : token ]
        let queryParams = ["dateFrom": date, "dateTo": date]
        
        Alamofire.request(urlAPI!, method: .get, parameters: queryParams, headers: headers).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.data {
                    let json = JSON(data: value)
                    
                    var appointments = [AppointmentData]()
                    
                    let rows = json["result"]["rows"].arrayValue
                    
                    for appointment in rows {
                        
                        let appointment = AppointmentData(
                            id: appointment["_id"].stringValue,
                            service: CatalogData(
                                databaseID: appointment["service"]["_id"].stringValue,
                                name: appointment["service"]["name"].stringValue,
                                description: appointment["service"]["description"].stringValue,
                                price: appointment["service"]["price"].intValue),
                            customer: UserData(
                                    id: appointment["customer"]["_id"].stringValue,
                                    name: appointment["customer"]["name"].stringValue,
                                    lastName: appointment["customer"]["lastName"].stringValue),
                            professional: UserData(
                                    id: appointment["professional"]["_id"].stringValue,
                                    name: appointment["professional"]["name"].stringValue,
                                    lastName: appointment["professional"]["lastName"].stringValue),
                            date: appointment["date"].stringValue,
                            latitude: appointment["latitude"].floatValue,
                            longitude: appointment["longitude"].floatValue,
                            address: appointment["address"].stringValue,
                            extraInfo: appointment["extraInfo"].stringValue,
                            isCancelled: appointment["isCancelled"].boolValue,
                            isConfirmed: appointment["isConfirmed"].boolValue)
                        
                        appointments.append(appointment)
                    }
                    
                    onSuccess(appointments)
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
