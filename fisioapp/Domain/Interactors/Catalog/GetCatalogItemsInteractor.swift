//
//  GetCatalogItemsInteractor.swift
//  fisioapp
//
//  Created by Gema Martinez on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol GetCatalogItemsInteractor {
    func execute(token: String, type: String, onSuccess: @escaping ([Catalog]) -> Void, onError: @escaping (String) -> Void)
}
