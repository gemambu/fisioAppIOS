//
//  GetAppointmentsInteractor.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 14/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol GetAppointmentsForDateFromBackEndInteractor {
    func execute(token: String, date: String, onSuccess: @escaping ([AppointmentData]) -> Void, onError: @escaping (String) -> Void)
}
