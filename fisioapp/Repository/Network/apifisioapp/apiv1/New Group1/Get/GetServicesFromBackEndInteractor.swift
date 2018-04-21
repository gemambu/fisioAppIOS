//
//  GetCatalogItemsFromBackEndInteractor.swift
//  fisioapp
//
//  Created by Gema Martinez on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol GetServicesFromBackEndInteractor {
    func execute(token: String, onSuccess: @escaping ([CatalogData]) -> Void, onError: @escaping (String) -> Void)
}
