//
//  RepositoryIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation


class RepositoryIntImpl: RepositoryInteractor {
    
    private var cache: CacheInteractor = CacheIntImpl() as CacheInteractor
    
    let authenticateUserInBackendInteractor: AuthenticateUserInBackendInteractor = AuthenticateUserInBackendIntImpl()
    let getUserFromBackendInteractor: GetUserFromBackendInteractor = GetUserFromBackendIntImpl()
    let registerUserInBackendInteractor: RegisterUserInBackendInteractor = RegisterUserInBackendIntImpl()
    let getAppointmentsForDateFromBackendInteractor: GetAppointmentsForDateFromBackEndInteractor = GetAppointmentsForDateFromBackEndIntImpl()
    let getServicesFromBackendInteractor: GetServicesFromBackEndInteractor = GetServicesFromBackEndIntImpl() as GetServicesFromBackEndInteractor
    let getProductsFromBackendInteractor: GetProductsFromBackEndInteractor = GetProductsFromBackEndIntImpl() as GetProductsFromBackEndInteractor
    let insertProductInteractor: InsertProductFromBackendInteractor = InsertProductFromBackendIntImpl() as InsertProductFromBackendInteractor
    let insertServiceInteractor: InsertServiceFromBackendInteractor = InsertServiceFromBackendIntImpl() as InsertServiceFromBackendInteractor
    let updateProductInteractor: UpdateProductFromBackendInteractor = UpdateProductFromBackendIntImpl() as UpdateProductFromBackendInteractor
    let updateServiceInteractor: UpdateServiceFromBackendInteractor = UpdateServiceFromBackendIntImpl() as UpdateServiceFromBackendInteractor
    let deleteProductInteractor: DeleteProductFromBackendInteractor = DeleteProductFromBackendIntImpl() as DeleteProductFromBackendInteractor
    let deleteServiceInteractor: DeleteServiceFromBackendInteractor = DeleteServiceFromBackendIntImpl() as DeleteServiceFromBackendInteractor
    
    func authenticateUser(email: String, password: String, onSuccess: @escaping (UserData, String) -> Void, onError: @escaping (String) -> Void) {
        
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

        
        
        
        getServicesFromBackendInteractor.execute(token: token,
                                                 onSuccess: {(itemsFromBackend: [CatalogData]) -> Void in
                                                    onSuccess(itemsFromBackend)
        },
                                                 onError: { (msg: String) -> Void in
                                                    onError(msg)
        })
       
        
    }
    
    func getProducts(token: String,  onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void) {

        cache.getProducts(onSuccess:
            {
                (itemsFromBackend: [CatalogData]) -> Void in
                onSuccess(itemsFromBackend)
                
        },onError: {_ in 
            self.populateProductsCache(token: token, onSuccess: onSuccess, onError: onError)
            
        })
    
        
    }
    
    private func populateProductsCache(token: String, onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void){
        getProductsFromBackendInteractor.execute(token: token,
                                                 onSuccess: {(itemsFromBackend: [CatalogData]) -> Void in
                                                    self.cache.saveAllProducts(products: itemsFromBackend)
                                                    onSuccess(itemsFromBackend)
        },
                                                 onError: { (msg: String) -> Void in
                                                    onError(msg)
        })
    }
    
    func insertProduct(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
        insertProductInteractor.execute(token: token, item: item,
                                        onSuccess: { (itemCatalogData: CatalogData) -> Void in
                                            //insertCatalogInCache(it, success)
                                            onSuccess("Item \(item.name) inserted successfully")
        },
                                        onError: { (msg: String) -> Void in
                                            onError("Error inserting item: \(item.name)")
        })
    }
    
    func insertService(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
        insertServiceInteractor.execute(token: token, item: item,
                                        onSuccess: { (itemCatalogData: CatalogData) -> Void in
                                            //insertCatalogInCache(it, success)
                                            onSuccess("Item \(item.name) inserted successfully")
        },
                                        onError: { (msg: String) -> Void in
                                            onError("Error inserting item: \(item.name)")
        })
    }
    
    func updateProduct(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
        
        updateProductInteractor.execute(token: token, item: item,
                                        onSuccess: { (msg: String) -> Void in
                                            onSuccess(msg)
        },
                                        onError: { (msg: String) -> Void in
                                            onError(msg)
        })
    }
    
    func updateService(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
        
        updateServiceInteractor.execute(token: token, item: item,
                                        onSuccess: { (msg: String) -> Void in
                                            onSuccess(msg)
        },
                                        onError: { (msg: String) -> Void in
                                            onError(msg)
        })
    }
    
    func deleteProduct(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
        
        deleteProductInteractor.execute(token: token, id: id,
                                        onSuccess: { (msg: String) -> Void in
                                            onSuccess(msg)
        },
                                        onError: { (msg: String) -> Void in
                                            onError(msg)
        })
    }
    
    func deleteService(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void){
        
        deleteServiceInteractor.execute(token: token, id: id,
                                        onSuccess: { (msg: String) -> Void in
                                            onSuccess(msg)
        },
                                        onError: { (msg: String) -> Void in
                                            onError(msg)
        })
    }

}
