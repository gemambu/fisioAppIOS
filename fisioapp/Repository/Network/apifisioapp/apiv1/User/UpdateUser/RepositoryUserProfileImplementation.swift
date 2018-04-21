//
//  RepositoryUserProfileImplementation.swift
//  fisioapp
//
//  Created by Alan Casas on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RepositoryUserProfileImplementation : RepositoryUserProfileInteractor {
    
    
    let defaults = UserDefaults.standard
    
    func execute(name: String, lastname: String?, email: String, address: String?, phone: String?, birthdate: String?, nationalId: String?, gender: String?, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        
        let token = defaults.string(forKey: "token")
        let userId = defaults.string(forKey: "userId")
        
        let headers: HTTPHeaders = [
            "Authorization": token!,
            "Content-type": "multipart/form-data"
        ]
        
        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_USERS_UPDATE_SERVER_PATH + "/" + userId! )

        let parameters = [ "name": name, "email": email ] as [String : Any]

        
        Alamofire.upload(multipartFormData: { (form: MultipartFormData) in
            
            for ( key, value ) in parameters {
                
                form.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                
            }
            
        },usingThreshold: UInt64.init(), to: urlAPI!, method: .put, headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    print("Succesfully uploaded")
                    print(response)
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
            }
        }
    }
    
    
}

