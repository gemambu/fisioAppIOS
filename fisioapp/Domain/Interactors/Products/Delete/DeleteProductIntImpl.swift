//
//  DeleteProductIntImpl.swift
//  fisioapp
//
//  Created by Gema Martinez on 21/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

class DeleteProductImpl: DeleteProductInteractor {
    func execute(token: String, id: String, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
        let repositoryInteractor: RepositoryInteractor = RepositoryIntImpl()
        
        repositoryInteractor.deleteProduct(token: token,
                                               id: id,
                                               onSuccess: { (msg: String) -> Void in
                                                onSuccess(msg)},
                                               onError: { (msg: String) -> Void in
                                                onError(msg)
        })
    }
    
}
