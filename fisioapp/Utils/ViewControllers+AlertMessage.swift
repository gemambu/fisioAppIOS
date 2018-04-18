//
//  ViewControllers+AlertMessage.swift
//  fisioapp
//
//  Created by Alan Casas on 12/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

extension UIViewController{
    func alertSuccessControllerToView( message: String, completionHandler: (((UIAlertAction))-> Void)?  ){
        let alertController = UIAlertController(title: "Todo salio bien", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: completionHandler)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertControllerToView( message: String ){
        let alertController = UIAlertController(title: "Hemos tenido un error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
