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
        
        //testUsers()
        testCatalog()
        
    }
    
    
    /******** Users ********/
    private func testUsers() {
        
        // Fake data for testing
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7Il9pZCI6IjVhOWYwNTRmNjAyZGQwZTU0MGM3MWJjNiIsImZlbGxvd3NoaXBOdW1iZXIiOjMzLCJnZW5kZXIiOiJtYWxlIiwibmFtZSI6ImZpc2lvIiwibGFzdE5hbWUiOiJsYXN0bmFtZSIsImVtYWlsIjoiZmlzaW9AaW52YWxpZC5jb20iLCJwYXNzd29yZCI6ImVmNzk3YzgxMThmMDJkZmI2NDk2MDdkZDVkM2Y4Yzc2MjMwNDhjOWMwNjNkNTMyY2M5NWM1ZWQ3YTg5OGE2NGYiLCJhZGRyZXNzIjoiRmlzaW8gQWRkcmVzcywgMzMiLCJwaG9uZSI6IjYyNjYyNjYyNiIsImJpcnRoRGF0ZSI6IjE5NzAtMTItMzBUMDA6MDA6MDAuMDAwWiIsIm5hdGlvbmFsSWQiOiIxMjM0NTY3OFoiLCJyZWdpc3RyYXRpb25EYXRlIjoiMjAxOC0wMS0wMVQwMTowMTowMC4wMDBaIiwibGFzdExvZ2luRGF0ZSI6IjIwMTgtMDMtMDdUMTY6MDA6MDAuMDAwWiIsIl9fdiI6MCwiaW1nIjoiNWE5ZjA1NGY2MDJkZDBlNTQwYzcxYmM2LTE4LmpwZyIsImRlbGV0ZWQiOmZhbHNlLCJpc1Byb2Zlc3Npb25hbCI6dHJ1ZX0sImlhdCI6MTUyNDMxODI2NSwiZXhwIjoxNTMyMDk0MjY1fQ.EiE86zqmlY-Ok-Vm_8k7nxPyN8HeOuT5PwXdS2_xZY0"
        let userId = "5a9f054f602dd0e540c71bc6"
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
                                  id: userId,
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
    
    
    /******** Catalog ********/
    private func testCatalog() {
        
        // Fake data for testing
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7Il9pZCI6IjVhOWYwNTRmNjAyZGQwZTU0MGM3MWJjNiIsImZlbGxvd3NoaXBOdW1iZXIiOjMzLCJnZW5kZXIiOiJtYWxlIiwibmFtZSI6ImZpc2lvIiwibGFzdE5hbWUiOiJsYXN0bmFtZSIsImVtYWlsIjoiZmlzaW9AaW52YWxpZC5jb20iLCJwYXNzd29yZCI6ImVmNzk3YzgxMThmMDJkZmI2NDk2MDdkZDVkM2Y4Yzc2MjMwNDhjOWMwNjNkNTMyY2M5NWM1ZWQ3YTg5OGE2NGYiLCJhZGRyZXNzIjoiRmlzaW8gQWRkcmVzcywgMzMiLCJwaG9uZSI6IjYyNjYyNjYyNiIsImJpcnRoRGF0ZSI6IjE5NzAtMTItMzBUMDA6MDA6MDAuMDAwWiIsIm5hdGlvbmFsSWQiOiIxMjM0NTY3OFoiLCJyZWdpc3RyYXRpb25EYXRlIjoiMjAxOC0wMS0wMVQwMTowMTowMC4wMDBaIiwibGFzdExvZ2luRGF0ZSI6IjIwMTgtMDMtMDdUMTY6MDA6MDAuMDAwWiIsIl9fdiI6MCwiaW1nIjoiNWE5ZjA1NGY2MDJkZDBlNTQwYzcxYmM2LTE4LmpwZyIsImRlbGV0ZWQiOmZhbHNlLCJpc1Byb2Zlc3Npb25hbCI6dHJ1ZX0sImlhdCI6MTUyNDMxODI2NSwiZXhwIjoxNTMyMDk0MjY1fQ.EiE86zqmlY-Ok-Vm_8k7nxPyN8HeOuT5PwXdS2_xZY0"
        let productId = "5a9f054f602dd0e540c71bd1"
        let serviceId = "5aa00e386281ea2d347d4732"
        let productCatalogItem = CatalogData(databaseID: productId, name: "Product name Changed", description: "Product description changed", price: 10.0, professional: nil, isActive: 1, type: "PRODUCT")
        let serviceCatalogItem = CatalogData(databaseID: serviceId, name: "Service name Changed", description: "Service description changed", price: 20.0, professional: nil, isActive: 1, type: "SERVICE")
        
        
        // DeleteProduct
        let deleteProductInteractor: DeleteProductFromBackendInteractor = DeleteProductFromBackendIntImpl()
        deleteProductInteractor.execute(token: token,
                                        id: productId,
                                        onSuccess: { (msg: String) -> Void in
                                            print("DELETE PRODUCT")
                                            print("====================")
                                            print("msg: \(msg)")
        },
                                        onError: { (msg: String) -> Void in
                                            print("DELETE PRODUCT")
                                            print("====================")
                                            print("Error: \(msg)")
        })
        // UpdateProduct
        let updateProductInteractor: UpdateProductFromBackendInteractor = UpdateProductFromBackendIntImpl()
        updateProductInteractor.execute(token: token,
                                        item: productCatalogItem,
                                        onSuccess: { (msg: String) -> Void in
                                            print("UPDATE PRODUCT")
                                            print("====================")
                                            print("msg: \(msg)")
        },
                                        onError: { (msg: String) -> Void in
                                            print("UPDATE PRODUCT")
                                            print("====================")
                                            print("Error: \(msg)")
        })
        
        // DeleteService
        let deleteServiceInteractor: DeleteServiceFromBackendInteractor = DeleteServiceFromBackendIntImpl()
        deleteServiceInteractor.execute(token: token,
                                        id: serviceId,
                                        onSuccess: { (msg: String) -> Void in
                                            print("DELETE SERVICE")
                                            print("====================")
                                            print("msg: \(msg)")
        },
                                        onError: { (msg: String) -> Void in
                                            print("DELETE SERVICE")
                                            print("====================")
                                            print("Error: \(msg)")
        })
    }

}
