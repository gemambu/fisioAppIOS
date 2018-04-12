//
//  LoginAndRegisterController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginAndRegisterController: UIViewController {
    
        @IBOutlet weak var textViews: UIView!
        @IBOutlet weak var registerButton: UIButton!
        @IBOutlet weak var profileImageView: UIImageView!
        @IBOutlet weak var nameTextField: UITextField!
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var passwordTextField: UITextField!
        @IBOutlet weak var loginRegisterSegmentedControl: UISegmentedControl!
        @IBOutlet weak var textFieldStackView: UIStackView!
        
        @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
        @IBOutlet weak var textViewToRegisterButtonConstraint: NSLayoutConstraint!
        @IBOutlet weak var textViewToSegmentedControlConstraint: NSLayoutConstraint!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle{
            return .lightContent
        }
        
        @IBAction func registerButton(_ sender: UIButton) {
            handleLoginRegister()
        }
        
        @IBAction func registerSegmentedController(_ sender: UISegmentedControl) {
            handleLoginRegisterChangeSegmentedControl()
        }
    }
    
    // MARK: - SetupUI
    extension LoginAndRegisterController{
        
        func setupUI()  {
            
            view.backgroundColor = UIColor(red: 61, green: 91, blue: 151)
            
            textViews.layer.cornerRadius = 5
            textViews.layer.masksToBounds = true
            
            registerButton.backgroundColor = UIColor(red: 80, green: 101, blue: 161)
            registerButton.layer.cornerRadius = 5
            registerButton.layer.masksToBounds = true
            
        }
    }
    
    // MARK: - SegmentedControl Register
    extension LoginAndRegisterController{
        func handleLoginRegisterChangeSegmentedControl() {
            let titleSegmentedControl = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
            registerButton.setTitle(titleSegmentedControl, for: .normal)
            
            //Cambiar la vista de los textFields tenemos el textView
            
            if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
                textViewHeightConstraint.constant = 126
                textViewToRegisterButtonConstraint.constant = 71.5
                textViewToSegmentedControlConstraint.constant = 71.5
                textFieldStackView.removeArrangedSubview(nameTextField)
            }else{
                textViewHeightConstraint.constant = 189
                textViewToRegisterButtonConstraint.constant = 40
                textViewToSegmentedControlConstraint.constant = 40
                textFieldStackView.removeArrangedSubview(emailTextField)
                textFieldStackView.removeArrangedSubview(passwordTextField)
                
                textFieldStackView.addArrangedSubview(nameTextField)
                textFieldStackView.addArrangedSubview(emailTextField)
                textFieldStackView.addArrangedSubview(passwordTextField)
            }
            
        }
    }
    
    // MARK: - Login Register
    extension LoginAndRegisterController{
        
        func handleLoginRegister (){
            if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
                handleLogin()
            }else{
                handleRegister()
            }
        }
        
    }
    
    // MARK: - Login
    extension LoginAndRegisterController{
        func handleLogin (){
            

            print("Login button pushed")
            guard let email = emailTextField.text, let password = passwordTextField.text else {
                print("Form is not complete")
                return
            }
            
            let authenticateUserIntImpl : AuthenticateUserInteractor = AuthenticateUserIntImpl()
            authenticateUserIntImpl.execute(email: email, password: password, onSuccess: { (user, message) in
                
                self.alertControllerToView(message: message)

            }) { (errorMessage) in
                self.alertControllerToView(message: errorMessage)
            }

        }
    }
    
    
    // MARK: - Login Register
    extension LoginAndRegisterController{
        func handleRegister(){
            
            print("Register button pushed")
            guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
                print("Form is not complete")
                return
            }
            
            let registerUserInteractorImplementation : RegisterUserInteractor = RegisterUserIntImpl()
            
            registerUserInteractorImplementation.execute(name: name, email: email, password: password, isProfessional: false, onSuccess: { (success, message) in

                self.alertControllerToView(message: message)
                
            }) { (errorMessage) in
                self.alertControllerToView(message: errorMessage)
            }
            
            
        }
    }
    
    // MARK: - UIColor Extension
    extension UIColor {
        convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
            self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        }
}
















