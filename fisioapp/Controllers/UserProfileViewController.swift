//
//  UserProfileViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 19/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var nationalIdTextField: UITextField!
    @IBOutlet weak var genderSwitch: UISwitch!
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        title = "Perfil"
        tabBarItem.image = #imageLiteral(resourceName: "007-businessman")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        addressTextField.delegate = self
        phoneTextField.delegate = self
        birthDateTextField.delegate = self
        nationalIdTextField.delegate = self
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    }

    
}

extension UserProfileViewController {
    @objc func saveUserProfile () {
        print("Se salvaran los datos en la base de datos")
    }
}

extension UserProfileViewController {
    @objc func takePictureToUpdateUserPicture () {
        print("Se tomara la imagen para mostrar imagenes de carrete o tomarse una nueva foto")
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
}
