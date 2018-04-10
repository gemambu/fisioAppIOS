//
//  RepositoryInteractor.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

protocol RepositoryInteractor {
    
    /******** users ********/
    func getUser(token: String, id: String, onSuccess: (String) -> Void, onError: (String) -> Void)
    
}
