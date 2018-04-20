//
//  UserPictureViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 19/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

protocol UserPictureViewControllerDelegate: class {
    func addPictureViewControllerDidCancel(controller: UserPictureViewController)
    func addPictureViewController(controller: UserPictureViewController, didFinishAdding picture: UIImage)
}

class UserPictureViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var userImage: UIImageView!
    
    weak var delegate : UserPictureViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takePictureButton(_ sender: UIButton) {
        
        print("Hacer foto")
        //Si la camara esta disponible
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            //creamos un controlador de picker
            let controller = UIImagePickerController()
            
            //le decimos que el controlador sera el que se delegue en si mismo
            controller.delegate = self
            
            //le decimos que el ususario podra editar la foto
            controller.allowsEditing = true
            
            //Le decimos que tipo de elemento queremos que use
            controller.sourceType = .camera
            
            //presentamos el controlador
            self.present(controller, animated: true, completion: nil)
            
        }else{
            
            print("No hay camara disponible")
            
        }
        
    }
    
    @IBAction func filmRollButton(_ sender: UIButton) {
        print("Coger foto del carrete")
        
        // Si el carrete de fotos esta disponible
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            //creamos un controlador de picker
            let controller = UIImagePickerController()
            
            //delegamos todo sobre el mismo controlador creado
            controller.delegate = self
            
            //permitimos que el usuario edite las fotos
            controller.allowsEditing = true
            
            //el controlador accede a las fotos guardadas
            controller.sourceType = .savedPhotosAlbum
            
            //
            self.present(controller, animated: true, completion: nil)
            
        }else {
            
            print("No se ha podido acceder a carrete")
            
        }
    }
    
}

extension UserPictureViewController {
    func setupUI(){
        // Creamos un botón a la barra del navigationController
        let cancel = UIBarButtonItem(title: "Cancel",
                                   style: .plain,
                                   target: self,
                                   action: #selector(cancelAction))
        
        let picture = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savePicture))
        
        navigationItem.rightBarButtonItem = picture
        navigationItem.leftBarButtonItem = cancel
    }
}

extension UserPictureViewController {
    @objc func cancelAction() {
        print("cancelAction pulsado")
        navigationController?.dismiss(animated: true, completion: nil)
        delegate?.addPictureViewControllerDidCancel(controller: self)
    }
}

extension UserPictureViewController {
    @objc func savePicture() {
        print("savePicture pulsado")
        
        if userImage.image == nil {
            userImage.image = #imageLiteral(resourceName: "no-image")
        }
        
        navigationController?.dismiss(animated: true, completion: nil)
        delegate?.addPictureViewController(controller: self, didFinishAdding: userImage.image!)
    }
}

extension UserPictureViewController{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            self.userImage.image = image
            
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
















