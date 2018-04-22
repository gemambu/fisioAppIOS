//
//  InsertProductFromBackendInteractor.swift
//  fisioapp
//
//  Created by Carlos on 22/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol InsertProductFromBackendInteractor {
    func execute(token: String, item: CatalogData, onSuccess: @escaping (CatalogData) -> Void, onError: @escaping (String) -> Void)
}
