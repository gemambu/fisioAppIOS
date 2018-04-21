//
//  BlankViewController.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

class BlankViewController: UIViewController {

    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fake data from MongoDB
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7Il9pZCI6IjVhOWYwNTRmNjAyZGQwZTU0MGM3MWJjNiIsImlzUHJvZmVzc2lvbmFsIjp0cnVlLCJmZWxsb3dzaGlwTnVtYmVyIjozMywiZ2VuZGVyIjoibWFsZSIsIm5hbWUiOiJmaXNpbyIsImxhc3ROYW1lIjoibGFzdG5hbWUiLCJlbWFpbCI6ImZpc2lvQGludmFsaWQuY29tIiwicGFzc3dvcmQiOiJlZjc5N2M4MTE4ZjAyZGZiNjQ5NjA3ZGQ1ZDNmOGM3NjIzMDQ4YzljMDYzZDUzMmNjOTVjNWVkN2E4OThhNjRmIiwiYWRkcmVzcyI6IkZpc2lvIEFkZHJlc3MsIDMzIiwicGhvbmUiOiI2MjY2MjY2MjYiLCJiaXJ0aERhdGUiOiIyMDE4LTA0LTA2VDE5OjQ3OjAyLjAwMFoiLCJuYXRpb25hbElkIjoiMTIzNDU2NzhaIiwicmVnaXN0cmF0aW9uRGF0ZSI6IjIwMTgtMDEtMDFUMDE6MDE6MDAuMDAwWiIsImxhc3RMb2dpbkRhdGUiOiIyMDE4LTAzLTA3VDE2OjAwOjAwLjAwMFoiLCJfX3YiOjAsImRlbGV0ZWQiOmZhbHNlfSwiaWF0IjoxNTIzNDAxNDA4LCJleHAiOjE1MjM1NzQyMDh9._oKrBZbALjYjr2WMVja8LqUcv-6bvqd2rbBXXTKtozE"
        let id = "5a9f054f602dd0e540c71bc6"
        let name = "Fisio"
        let newName = "NewFisio"
        let email = "fisio@invalid.com"
        let newEmail = "newfisio@invalid.com"
        let password = "12345678"

        // AuthenticateUser
        let authenticateUserInteractor: AuthenticateUserInteractor = AuthenticateUserIntImpl()
        authenticateUserInteractor.execute(email: email,
                                  password: password,
                                  onSuccess: { (user: User, tkn: String) -> Void in
                                    print("AUTHENTICATE USER")
                                    print("====================")
                                    print("id: \(user.id)")
                                    print("Name: \(user.name)")
                                    print("Email: \(user.email)")
                                    print("Token: \(tkn)")
        },
                                  onError: { (msg: String) -> Void in
                                    print("Error: \(msg)")
        })
        // GetUser
        let getUserInteractor: GetUserInteractor = GetUserIntImpl()
        getUserInteractor.execute(token: token,
                                  id: id,
                                  onSuccess: { (user: User) -> Void in
                                    print("GET USER")
                                    print("====================")
                                    print("Name: \(user.name)")
                                    print("Email: \(user.email)")
                                    self.user = user
        },
                                  onError: { (msg: String) -> Void in
                                    print("Error: \(msg)")
        })
        // RegisterUser
        let registerUserInteractor: RegisterUserInteractor = RegisterUserIntImpl()
        registerUserInteractor.execute(name: newName,
                                       email: newEmail,
                                       password: password,
                                       isProfessional: false,
                                       onSuccess: { (ok: Bool, msg: String) -> Void in
                                        print("REGISTER USER")
                                        print("====================")
                                        print("Ok: \(ok)")
                                        print("msg: \(msg)")
                                        },
                                       onError: { (msg: String) -> Void in
                                        print("Error: \(msg)")
                                        })
    }

}
