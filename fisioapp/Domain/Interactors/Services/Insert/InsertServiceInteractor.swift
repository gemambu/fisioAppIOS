//
//  InsertServiceInteractor.swift
//  fisioapp
//
//  Created by Gema Martinez on 22/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol InsertServiceInteractor {
    func execute(token: String, item: Catalog, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
}
