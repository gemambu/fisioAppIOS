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
                                                            let appointment = convert(appointmentData: appointment)
                                                            
                                                            appointmentsResult.append(appointment)
                                                        }
                                                        onSuccess(appointmentsResult)},
                                                    onError: { (msg: String) -> Void in
                                                        onError(msg)
                                                    })
    }
    
    
    
}
