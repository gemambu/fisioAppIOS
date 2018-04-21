//
//  GetCatalogItemsIntImpl.swift
//  fisioapp
//
//  Created by Gema Martinez on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class GetProductsIntImpl: GetProductsInteractor {
    func execute(token: String, onSuccess: @escaping ([Catalog]) -> Void, onError: @escaping (String) -> Void) {
        
        let repositoryInteractor: RepositoryInteractor = RepositoryIntImpl()
        
        repositoryInteractor.getProducts(token: token,
                                             onSuccess: { (items: [CatalogData]) in
                                                var catalogItemsResult = [Catalog]()
                                                
                                                for item in items {
                                                    let catalogInfo = self.entityMapper(itemData: item)
                                                    
                                                    catalogItemsResult.append(catalogInfo)
                                                }
                                                onSuccess(catalogItemsResult)},
                                             onError: { (msg: String) -> Void in
                                                onError(msg)
        })
    }
    
    private func entityMapper(itemData: CatalogData) -> Catalog {
        let item = Catalog(
            id: itemData.databaseID,
            name: itemData.name,
            description: itemData.description,
            price: itemData.price,
            professional: UserData(id: itemData.professional.id,
                                   name: itemData.professional.name,
                                   lastName: itemData.professional.lastName),
            isActive: itemData.isActive,
            type: itemData.type)
        
        return item
    }
    
    
}
