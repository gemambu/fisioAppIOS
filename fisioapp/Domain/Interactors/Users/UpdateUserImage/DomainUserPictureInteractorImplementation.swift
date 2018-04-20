//
//  DomainUserProfileInteractorImplementation.swift
//  fisioapp
//
//  Created by Alan Casas on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

class DomainUserPictureInteractorImplementation : DomainUserPictureInteractor {
    func execute(image: UIImage, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        let respositoryInteractor: RepositoryUserPictureInteractor = RepositoryUserPictureInteractorImplementation()
        
        respositoryInteractor.execute( image: image, onSuccess: { (success, message) in
            
            onSuccess(success, message)
            
        }) { (message) in
            onError(message)
        }
    }
    
    
    
}
