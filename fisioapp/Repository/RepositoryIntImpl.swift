//
//  RepositoryIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
class RepositoryIntImpl: RepositoryInteractor {
    
    func authenticateUser(email: String, password: String, onSuccess: @escaping (UserData, String) -> Void, onError: @escaping (String) -> Void) {
        let authenticateUserInBackendInteractor: AuthenticateUserInBackendInteractor = AuthenticateUserInBackendIntImpl()
        authenticateUserInBackendInteractor.execute(email: email,
                                                    password: password,
                                                    onSuccess: { (userData: UserData, token: String) -> Void in
                                                        onSuccess(userData, token)
                                                        },
                                                    onError: { (msg: String) -> Void in
                                                        onError(msg)
                                                        })
    }
    
    func getUser(token: String, id: String, onSuccess: @escaping (UserData) -> Void, onError: @escaping (String) -> Void) {
        let getUserFromBackendInteractor: GetUserFromBackendInteractor = GetUserFromBackendIntImpl()
        getUserFromBackendInteractor.execute(token: token,
                                             id: id,
                                             onSuccess: { (userData: UserData) -> Void in
                                                onSuccess(userData)
        },
                                             onError: { (msg: String) -> Void in
                                                onError(msg)
        }
        )
    }
    
    func registerUser(name: String, email: String, password: String, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        let registerUserInBackendInteractor: RegisterUserInBackendInteractor = RegisterUserInBackendIntImpl()
        registerUserInBackendInteractor.execute(name: name,
                                                email: email,
                                                password: password,
                                                onSuccess: { (ok: Bool, msg: String) -> Void in
                                                    onSuccess(ok, msg)
                                                    },
                                                onError: { (msg: String) -> Void in
                                                    onError(msg)
                                                    })
    }
    
    
    /******** appointments ********/
    func getAppointmentsForDate(token: String, date: String, onSuccess: @escaping ([AppointmentData]) -> Void, onError: @escaping (String) -> Void) {
        
        let getAppointmentsForDateFromBackendInteractor: GetAppointmentsForDateFromBackEndInteractor = GetAppointmentsForDateFromBackEndIntImpl()
        
//        getAppointmentsForDateFromBackendInteractor.execute(token: token,
//                                                            date: date,
//                                                            onSuccess: {([AppointmentData]) -> Void in
//                                                                onSuccess([AppointmentData])
//        },
//                                                            onError: { (msg: String) -> Void in
//                                                                onError(msg)
//        })
        
        getAppointmentsForDateFromBackendInteractor.execute(token: "", date: "", onSuccess: {_ in
            
        }, onError: {_ in
            
        })
        
    }
    
    /******** catalog ********/
    
    func getCatalogItems(token: String, type: String, onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void) {
        let getCatalogItemsFromBackendInteractor: GetCatalogItemsFromBackEndInteractor = GetCatalogItemsFromBackEndIntImpl() as! GetCatalogItemsFromBackEndInteractor
        
        getCatalogItemsFromBackendInteractor.execute(token: token,
                                                     type: type,
                                                     onSuccess: {(itemsFromBackend: [CatalogData]) -> Void in
                                                        onSuccess(itemsFromBackend)
        },
                                                     onError: { (msg: String) -> Void in
                                                        onError(msg)
        })
    }
    
    func saveCatalogItem(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        //
    }
    
    func deleteCatalogItem(token: String, id: String, type: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        //
    }

}
