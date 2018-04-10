//
//  BlankViewController.swift
//  fisioapp
//
//  Created by Carlos on 10/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

class BlankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("START")

        let getUserInteractor: GetUserInteractor = GetUserIntImpl()
        getUserInteractor.execute(token: "token",
                                  id: "id",
                                  onSuccess: { (name: String) -> Void in
                                    print("Success: \(name)")
                                    },
                                  onError: { (msg: String) -> Void in
                                    print("Error: \(msg)")
                                    })
        print("END")

    }

}
