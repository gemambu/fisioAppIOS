//
//  ProductViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var isActiveSwitch: UISwitch!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    var product: Catalog?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.product?.type
        
        self.nameText.text = self.product?.name
        self.descriptionText.text = self.product?.description
        self.priceText.text = "\(self.product?.price ?? 0) €"
        self.isActiveSwitch.isOn =  self.product?.isActive == 1
        
        setButtonStates(isNew: self.product === nil)
        
        let cancel = UIBarButtonItem(title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(cancelNewProduct))
        
        navigationItem.leftBarButtonItem = cancel
    }
    
    @objc private func cancelNewProduct() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setButtonStates(isNew: Bool) {
        if (isNew){
            
            // by default, delete button is hidden
            self.deleteButton.isHidden = true
            self.deleteButton.isEnabled = false
            
            self.saveButton.setTitle("Insert", for: .normal)
            
        } else {
            // loading an existing product, enable the delete option
            self.deleteButton?.isHidden = false
            self.deleteButton?.isEnabled = true
            
            self.saveButton.setTitle("Update", for: .normal)
        }
    }
    
    func loadProductInfo(product: Catalog) {
        self.product = product
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
