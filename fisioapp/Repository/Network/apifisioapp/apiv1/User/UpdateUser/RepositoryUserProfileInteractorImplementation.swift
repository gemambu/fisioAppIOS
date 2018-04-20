//
//  RepositoryUserProfileInteractorimplementation.swift
//  fisioapp
//
//  Created by Alan Casas on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


typealias Parameters = [String: Any]

class RepositoryUserProfileInteractorImplementation : RepositoryUserProfileInteractor {
    
    let defaults = UserDefaults.standard
    
    func execute(name: String, lastname: String?, email: String, address: String?, phone: String?, birthdate: String?, nationalId: String?, gender: String?, image: UIImage, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {
        
        let token = defaults.string(forKey: "token")
        let userId = defaults.string(forKey: "userId")
        
        let headers: HTTPHeaders = [
            "Authorization": token!,
            "Content-type": "multipart/form-data"
        ]
        
//        guard let mediaImage = Media(withImage: image, forKey: "image")else { return }
        
        let imageData = UIImageJPEGRepresentation(image, 0.5)

        
        
        let parameters = [ "name": name, "email": email, "image" : image ] as [String : Any]
        
        let urlAPI = URL(string: "http://localhost:3000/apiv1/uploads/users/\(userId!)")
        
        Alamofire.upload(multipartFormData: { (form: MultipartFormData) in
            
            for ( key, value ) in parameters {
                
                form.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                
            }
            
            if let data = imageData {
                form.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
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

















