//
//  Appointment.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 16/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

public class AppointmentDomain {
    var id: String = ""
    var service: CatalogData
    var customer: UserData
    var professional: UserData
    var date: String = ""
    var latitude: Float = 0
    var longitude: Float = 0
    var address: String = ""
    var extraInfo: String = ""
    var isCancelled: Bool = false
    var isConfirmed: Bool = false
    
    public init (id: String, service: CatalogData, customer: UserData, professional: UserData, date: String, latitude: Float, longitude: Float, address: String, extraInfo: String, isCancelled: Bool, isConfirmed: Bool){
        
        self.id = id
        self.service = service
        self.customer = customer
        self.professional = professional
        self.date = date
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.extraInfo = extraInfo
        self.isCancelled = isCancelled
        self.isConfirmed = isConfirmed
    }
}
