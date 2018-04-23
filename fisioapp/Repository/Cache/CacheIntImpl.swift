//
//  CacheIntImpl.swift
//  fisioapp
//
//  Created by Carlos on 22/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CacheIntImpl: CacheInteractor {
    
    var context: NSManagedObjectContext!
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.context
    }
    
    
    func getAppointmentsForDate(date: String, onSuccess: @escaping ([AppointmentData]) -> Void, onError: @escaping (String) -> Void) {
        
    }
    
    func getProducts(onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void) {
     
        let productsCD = self.getCDProducts()
        
        if(productsCD != nil && (productsCD?.fetchedObjects?.count)! > 0){
            var products:[CatalogData] = []
            productsCD?.fetchedObjects?.forEach({ (productCD) in
                products.append(mapEntityCDToEntity(item: productCD)!)
            })
            onSuccess(products)
        } else {
            onError("There are not products on cache!")
        }
        
    }
    
    
    
    func getServices(onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void) {
        
    }
    
    func saveAllProducts(products: [CatalogData]){
        
        for i in 0 ..< products.count {
            let product = products[i]
            
            let _ = mapEntityIntoEntityCD(context: context, product: product)
        }
        
        do {
            try context.save()
            
        } catch {
            print("Error saving PRODUCTS in CoreData")
        }
        
    }
    
    
    func insertProduct(item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
    }
    
    func insertService(item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
    }
    
    func updateProduct(item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
    }
    
    func updateService(item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
    }
    
    func deleteProduct(id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
    }
    
    func deleteService(id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
    }
    
    
    // MARK - Core Data Functions
    
    private func getCDProducts() -> NSFetchedResultsController<CatalogCD>? {
        // MARK: - Fetched results controller
        
        var _fetchedResultsController: NSFetchedResultsController<CatalogCD>? = nil
        
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<CatalogCD> = CatalogCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        // filter by the entity type
        fetchRequest.predicate = NSPredicate(format: "type == %@", "PRODUCT")
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        
        // fetchedRequest == SELECT * FROM EVENT PRDER BY TIMESTAMP DESC
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "EntitiesChacheFile")
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("💩 Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
}
