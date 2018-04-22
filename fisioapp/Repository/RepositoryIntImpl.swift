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
    
    func getServices(token: String, onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void) {

        
        let getServicesFromBackendInteractor: GetServicesFromBackEndInteractor = GetServicesFromBackEndIntImpl() as GetServicesFromBackEndInteractor
        
        getServicesFromBackendInteractor.execute(token: token,
                                                 onSuccess: {(itemsFromBackend: [CatalogData]) -> Void in
                                                    onSuccess(itemsFromBackend)
        },
                                                 onError: { (msg: String) -> Void in
                                                    onError(msg)
        })
       
        
    }
    
    func getProducts(token: String,  onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void) {

        let getProductsFromBackendInteractor: GetProductsFromBackEndInteractor = GetProductsFromBackEndIntImpl() as GetProductsFromBackEndInteractor
        
        getProductsFromBackendInteractor.execute(token: token,
                                                 onSuccess: {(itemsFromBackend: [CatalogData]) -> Void in
                                                    onSuccess(itemsFromBackend)
        },
                                                 onError: { (msg: String) -> Void in
                                                    onError(msg)
        })
        
        
    }
    
    func insertProduct(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){

    }
    
    func insertService(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
    }
    
    func updateProduct(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
        let updateProductInteractor: UpdateProductFromBackendInteractor = UpdateProductFromBackendIntImpl() as UpdateProductFromBackendInteractor
        updateProductInteractor.execute(token: token, item: item,
                                        onSuccess: { (msg: String) -> Void in
                                            onSuccess(msg)
        },
                                        onError: { (msg: String) -> Void in
                                            onError(msg)
        })
    }
    
    func updateService(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
        let updateServiceInteractor: UpdateServiceFromBackendInteractor = UpdateServiceFromBackendIntImpl() as UpdateServiceFromBackendInteractor
        updateServiceInteractor.execute(token: token, item: item,
                                        onSuccess: { (msg: String) -> Void in
                                            onSuccess(msg)
        },
                                        onError: { (msg: String) -> Void in
                                            onError(msg)
        })
    }
    
    func deleteProduct(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
        let deleteProductInteractor: DeleteProductFromBackendInteractor = DeleteProductFromBackendIntImpl() as DeleteProductFromBackendInteractor
        deleteProductInteractor.execute(token: token, id: id,
                                        onSuccess: { (msg: String) -> Void in
                                            onSuccess(msg)
        },
                                        onError: { (msg: String) -> Void in
                                            onError(msg)
        })
    }
    
    func deleteService(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        let deleteServiceInteractor: DeleteServiceFromBackendInteractor = DeleteServiceFromBackendIntImpl() as DeleteServiceFromBackendInteractor
        deleteServiceInteractor.execute(token: token, id: id,
                                        onSuccess: { (msg: String) -> Void in
                                            onSuccess(msg)
        },
                                        onError: { (msg: String) -> Void in
                                            onError(msg)
        })
    }

}
