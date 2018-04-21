//
//  RepositoryUserProfileInteractor.swift
//  fisioapp
//
//  Created by Alan Casas on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

protocol RepositoryUserPictureInteractor {
    func execute( image: UIImage, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void)
}
