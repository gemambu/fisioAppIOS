//
//  CacheInteractor.swift
//  fisioapp
//
//  Created by Carlos on 22/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol CacheInteractor {
    /******** appointments ********/
    func getAppointmentsForDate(date: String, onSuccess: @escaping ([AppointmentData]) -> Void, onError: @escaping (String) -> Void)
    
    /******** catalog ********/
    func getProducts(onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void)
    func saveAllProducts(products: [CatalogData])
    
    func getServices(onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void)
    func insertProduct(item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func insertService(item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func updateProduct(item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func updateService(item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func deleteProduct(id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    func deleteService(id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
    
}
