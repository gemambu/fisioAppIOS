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

class RepositoryUserPictureInteractorImplementation : RepositoryUserPictureInteractor {
    
    let defaults = UserDefaults.standard
    
    func execute(image: UIImage, onSuccess: @escaping (Bool, String) -> Void, onError: @escaping (String) -> Void) {

        let token = defaults.string(forKey: "token")
        let userId = defaults.string(forKey: "userId")
        
        let headers: HTTPHeaders = [
            "Authorization": token!,
            "Content-type": "multipart/form-data"
        ]

        let urlAPI = URL(string: DEBUG_HTTP_SERVER + FISIOAPP_USERS_UPDATE_IMAGE_SERVER_PATH + "/" + userId! )

        let imageData = UIImageJPEGRepresentation(image, 0.5)

        let parameters = [ "image" : image ] as [String : Any]
        
        Alamofire.upload(multipartFormData: { (form: MultipartFormData) in
            
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

















