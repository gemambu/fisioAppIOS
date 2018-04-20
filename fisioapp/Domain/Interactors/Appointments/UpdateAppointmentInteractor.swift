//
//  UpdateAppointmentInteractor.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol UpdateAppointmentInteractor {
    func execute(token: String, id: String, isConfirmed: Bool, isCancelled: Bool, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void)
}
