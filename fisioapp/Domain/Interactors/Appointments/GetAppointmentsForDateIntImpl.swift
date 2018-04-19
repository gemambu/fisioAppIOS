//
//  GetAppointmentsForDateIntImpl.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 16/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class GetAppointmentsForDateIntImpl: GetAppointmentsForDateInteractor {
    func execute(token: String, date: String, onSuccess: @escaping ([AppointmentDomain]) -> Void, onError: @escaping (String) -> Void) {
        
        let repositoryInteractor: RepositoryInteractor = RepositoryIntImpl()
        
        repositoryInteractor.getAppointmentsForDate(token: token,
                                                    date: date,
                                                    onSuccess: { (appointments: [AppointmentData]) in
                                                        var appointmentsResult = [AppointmentDomain]()
                                                        
                                                        for appointment in appointments {
                                                            let appointment = self.entityMapper(appointmentData: appointment)
                                                            
                                                            appointmentsResult.append(appointment)
                                                        }
                                                        onSuccess(appointmentsResult)},
                                                    onError: { (msg: String) -> Void in
                                                        onError(msg)
                                                    })
    }
    
    private func entityMapper(appointmentData: AppointmentData) -> AppointmentDomain {
        let appointment = AppointmentDomain(
                                      id: appointmentData.id,
                                      service: CatalogData(databaseID: appointmentData.service.databaseID,
                                                           name: appointmentData.service.name,
                                                           description: appointmentData.service.description,
                                                           price: appointmentData.service.price),
                                      customer: UserData(id: appointmentData.customer.id,
                                                         name: appointmentData.customer.name,
                                                         lastName: appointmentData.customer.lastName),
                                      professional: UserData(id: appointmentData.professional.id,
                                                             name: appointmentData.professional.name,
                                                             lastName: appointmentData.professional.lastName),
                                      date: appointmentData.date,
                                      latitude: appointmentData.latitude,
                                      longitude: appointmentData.longitude,
                                      address: appointmentData.address,
                                      extraInfo: appointmentData.extraInfo,
                                      isCancelled: appointmentData.isCancelled,
                                      isConfirmed: appointmentData.isConfirmed)
        
        return appointment
    }
    
    
}
