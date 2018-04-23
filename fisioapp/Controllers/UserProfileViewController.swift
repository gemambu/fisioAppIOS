//
//  UserProfileViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 19/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UserPictureViewControllerDelegate {
    
    @IBOutlet weak var userPicture: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var nationalIdTextField: UITextField!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    
    private var userToUpdate: User? = nil
    
    init(){
        //self.userToUpdate = model
        super.init(nibName: nil, bundle: nil)
        title = "Perfil"
        tabBarItem.image = #imageLiteral(resourceName: "007-businessman")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (!CustomUserDefaults.checkToken()) {
            checkLogin()
        }
        
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        addressTextField.delegate = self
        phoneTextField.delegate = self
        birthDateTextField.delegate = self
        nationalIdTextField.delegate = self
        
        getUser()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUser() {
        let getUserInteractor: GetUserInteractor = GetUserIntImpl()
        getUserInteractor.execute(token: CustomUserDefaults.token,
                                  id: CustomUserDefaults.userId,
                                  onSuccess: { (user: User) -> Void in
                                    print("GET USER")
                                    print("====================")
                                    print("Name: \(user.name)")
                                    print("Email: \(user.email)")
                                    self.userToUpdate = user
        },
                                  onError: { (msg: String) -> Void in
                                    print("Error: \(msg)")
        })
    }
    
    func setupUI(){
        // Creamos un botón a la barra del navigationController
        let save = UIBarButtonItem(title: "Save",
            style: .plain,
            target: self,
            action: #selector(saveUserProfile))
        
        let picture = UIBarButtonItem(title: "Picture", style: .plain, target: self, action: #selector(takePictureToUpdateUserPicture))
        
        navigationItem.rightBarButtonItem = picture
        navigationItem.leftBarButtonItem = save
        
        nameTextField.text = userToUpdate?.name ?? ""
        lastNameTextField.text = userToUpdate?.lastName ?? ""
        emailTextField.text = userToUpdate?.email ?? ""
        addressTextField.text = userToUpdate?.address ?? ""
        phoneTextField.text = userToUpdate?.phone ?? ""
        birthDateTextField.text = "\(String(describing: userToUpdate?.birthDate))"
        nationalIdTextField.text = userToUpdate?.nationalId ?? ""
        
    }
    
}

extension UserProfileViewController {
    
    func addPictureViewControllerDidCancel(controller: UserPictureViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addPictureViewController(controller: UserPictureViewController, didFinishAdding picture: UIImage) {
        userPicture.image = picture
        navigationController?.popViewController(animated: true)
    }

}

extension UserProfileViewController {
    @objc func saveUserProfile () {
        print("Se salvaran los datos en la base de datos")
        let gender: String
        
        if genderSegmentControl.selectedSegmentIndex == 0 {
            gender = "Male"
        }else{
            gender = "Female"
        }
        
        guard let name = nameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text, let address = addressTextField.text, let phone = phoneTextField.text, let birhdate = birthDateTextField.text, let nationalID = nationalIdTextField.text else {
            print("Form is not complete")
            return
        }
                
        let userProfileUpdateImplementation: DomainUserProfileInteractor = DomainUserProfileImplementation()
        
        userProfileUpdateImplementation.execute(name: name, lastname: lastName, email: email, address: address, phone: phone, birthdate: birhdate, nationalId: nationalID, gender: gender, onSuccess: { (success, message) in
            
            print(" \(name), \(lastName), \(email), \(address), \(phone), \(birhdate), \(nationalID), \(gender) ")

        }) { (errorMessage) in
            self.alertControllerToView(message: errorMessage)
        }
        
    }
}

extension UserProfileViewController {
    @objc func takePictureToUpdateUserPicture () {
        let userPictureViewController = UserPictureViewController()
        let navigationUserPictureVC = UINavigationController(rootViewController: userPictureViewController)
        
        userPictureViewController.delegate = self
        navigationController?.present(navigationUserPictureVC, animated: true, completion: nil)
    }
}

extension UserProfileViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()

        return true
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case nationalIdTextField:
            scrollView.setContentOffset(CGPoint(x: 0, y: 230), animated: true)
        case birthDateTextField:
            scrollView.setContentOffset(CGPoint(x: 0, y: 230), animated: true)
        case phoneTextField:
            scrollView.setContentOffset(CGPoint(x: 0, y: 230), animated: true)
        default:
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
}

// MARK: - checkLogin
extension UserProfileViewController {
    func checkLogin()  {
        if let navigator = navigationController {
            navigator.pushViewController(LoginAndRegisterController(), animated: false)
        }
    }
}









