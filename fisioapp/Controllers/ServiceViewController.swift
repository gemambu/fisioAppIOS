//
//  ServiceViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {

    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var descriptionView: UITextField!
    @IBOutlet weak var priceView: UITextField!
    @IBOutlet weak var isActiveSwitch: UISwitch!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var service: Catalog?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.service?.type
        
        self.nameView.text = self.service?.name
        self.descriptionView.text = self.service?.description
        self.priceView.text = "\(self.service?.price ?? 0) €"
        self.isActiveSwitch.isOn =  self.service?.isActive == 1
        
        setButtonStates(isNew: self.service === nil)
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
    
    func loadServiceInfo(service: Catalog) {
        self.service = service
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
