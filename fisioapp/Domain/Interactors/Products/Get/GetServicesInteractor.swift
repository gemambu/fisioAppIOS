//
//  GetCatalogItemsInteractor.swift
//  fisioapp
//
//  Created by Gema Martinez on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol GetServicesInteractor {
    func execute(token: String, onSuccess: @escaping ([Catalog]) -> Void, onError: @escaping (String) -> Void)
}
