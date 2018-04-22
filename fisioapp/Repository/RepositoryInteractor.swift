//
//  RepositoryInteractor.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol RepositoryInteractor {
    
    /******** users ********/
    func authenticateUser(email: String, password: String, onSuccess: @escaping (UserData, String) -> Void, onError: @escaping (String) -> Void)
    func getUser(token: String, id: String, onSuccess: @escaping (UserData) -> Void, onError: @escaping (String) -> Void)
    func registerUser(name: String, email: String, password: String, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void)
    
    
    /******** appointments ********/
    func getAppointmentsForDate(token: String, date: String, onSuccess: @escaping ([AppointmentData]) -> Void, onError: @escaping (String) -> Void)
    
    /******** catalog ********/
    func getProducts(token: String, onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void)
    func getServices(token: String, onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void)
    func insertProduct(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func insertService(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func updateProduct(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func updateService(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func deleteProduct(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func deleteService(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
}
