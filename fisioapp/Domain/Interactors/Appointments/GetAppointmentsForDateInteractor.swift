//
//  GetAppointmentsInteractor.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 16/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol GetAppointmentsForDateInteractor {
    func execute(token: String, date: String, onSuccess: @escaping ([Appointment]) -> Void, onError: @escaping (String) -> Void)
}
