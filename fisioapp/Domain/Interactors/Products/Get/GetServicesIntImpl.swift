//
//  GetCatalogItemsIntImpl.swift
//  fisioapp
//
//  Created by Gema Martinez on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class GetServicesIntImpl: GetServicesInteractor {
    func execute(token: String, onSuccess: @escaping ([Catalog]) -> Void, onError: @escaping (String) -> Void) {
        
        let repositoryInteractor: RepositoryInteractor = RepositoryIntImpl()
        
        repositoryInteractor.getServices(token: token,
                                             onSuccess: { (items: [CatalogData]) in
                                                var catalogItemsResult = [Catalog]()
                                                
                                                for item in items {
                                                    let catalogInfo = convert(item: item)
                                                    catalogItemsResult.append(catalogInfo)
                                                }
                                                onSuccess(catalogItemsResult)},
                                             onError: { (msg: String) -> Void in
                                                onError(msg)
        })
    }
    
}
