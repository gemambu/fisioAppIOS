//
//  InsertProductIntImpl.swift
//  fisioapp
//
//  Created by Gema Martinez on 22/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class InsertProductIntImpl: InsertProductInteractor {
    func execute(token: String, item: Catalog, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
        let repositoryInteractor: RepositoryInteractor = RepositoryIntImpl()
        
        repositoryInteractor.insertProduct(token: token,
                                           item: convert(item: item),
                                           onSuccess: { (msg: String) -> Void in
                                            onSuccess(msg)},
                                           onError: { (msg: String) -> Void in
                                            onError(msg)
        })
    }
    
    
    
}
