//
//  UpdateAppointmentIntImpl.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class UpdateAppointmentIntImpl: UpdateAppointmentInteractor {
    func execute(token: String, id: String, isConfirmed: Bool, isCancelled: Bool, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        
        let repositoryInteractor: RepositoryInteractor = RepositoryIntImpl()
        
        repositoryInteractor.updateAppointment(token: token,
                                               id: id,
                                               isConfirmed: isConfirmed,
                                               isCancelled: isCancelled,
                                               onSuccess: { (ok: Bool, msg: String) -> Void in
                                                onSuccess(ok, msg)
        },
                                               onError: { (msg: String) -> Void in
                                                onError(msg)
        })
    }
}
