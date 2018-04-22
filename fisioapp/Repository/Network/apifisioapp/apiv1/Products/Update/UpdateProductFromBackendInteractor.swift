//
//  UpdateProductFromBackendInteractor.swift
//  fisioapp
//
//  Created by Carlos on 21/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol UpdateProductFromBackendInteractor {
    func execute(token: String, item: CatalogData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
}
