//
//  AppoitmentViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

class AppoitmentViewController: UIViewController {
    
    var appointment: AppointmentModel!
    
    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var customer: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var confirmedSwitch: UISwitch!
    @IBOutlet weak var cancelledSwitch: UISwitch!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapURL = "http://maps.googleapis.com/maps/api/staticmap?center=\(appointment.lat),\(appointment.long)&zoom=16&size=320x220&scale=2&markers=color:blue%7C\(appointment.lat),\(appointment.long)"
        let url = URL(string: mapURL)
        var imageData = NSData(contentsOf: url!)
        var image = #imageLiteral(resourceName: "map_placeholder.gif")
        if (imageData != nil){
            image = UIImage.init(data: imageData! as Data)!
        }
        
        map.image = image
        customer.text = appointment.customer
        address.text = appointment.address
        price.text = "\(appointment.price)€"
        confirmedSwitch.isOn = appointment.isConfirmed
        cancelledSwitch.isOn = appointment.isCancelled
        
        if (appointment.isCancelled) {
            confirmedSwitch.isEnabled = false
            cancelledSwitch.isEnabled = false
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
