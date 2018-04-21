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
    
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7Il9pZCI6IjVhOWYwNTRmNjAyZGQwZTU0MGM3MWJjNiIsImlzUHJvZmVzc2lvbmFsIjp0cnVlLCJmZWxsb3dzaGlwTnVtYmVyIjozMywiZ2VuZGVyIjoibWFsZSIsIm5hbWUiOiJmaXNpbyIsImxhc3ROYW1lIjoibGFzdG5hbWUiLCJlbWFpbCI6ImZpc2lvQGludmFsaWQuY29tIiwicGFzc3dvcmQiOiJlZjc5N2M4MTE4ZjAyZGZiNjQ5NjA3ZGQ1ZDNmOGM3NjIzMDQ4YzljMDYzZDUzMmNjOTVjNWVkN2E4OThhNjRmIiwiYWRkcmVzcyI6IkZpc2lvIEFkZHJlc3MsIDMzIiwicGhvbmUiOiI2MjY2MjY2MjYiLCJiaXJ0aERhdGUiOiIxOTcwLTEyLTMwVDEyOjMwOjAwLjAwMFoiLCJuYXRpb25hbElkIjoiMTIzNDU2NzhaIiwicmVnaXN0cmF0aW9uRGF0ZSI6IjIwMTgtMDEtMDFUMDE6MDE6MDAuMDAwWiIsImxhc3RMb2dpbkRhdGUiOiIyMDE4LTAzLTA3VDE2OjAwOjAwLjAwMFoiLCJfX3YiOjAsImRlbGV0ZWQiOmZhbHNlfSwiaWF0IjoxNTI0MzQwNDg4LCJleHAiOjE1MjQ1MTMyODh9.Co3cyQ8FL-q8EHapZbE0RhWUPfZJkol7ayQ2RzgU8uo"
    
    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var customer: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var confirmedSwitch: UISwitch!
    @IBOutlet weak var cancelledSwitch: UISwitch!
    
    @IBAction func confirmedChanged(_ sender: Any) {
        self.statusChanged(isConfirmed: confirmedSwitch.isOn, isCancelled: cancelledSwitch.isOn )
    }
    
    @IBAction func cancelledChanged(_ sender: Any) {
        self.statusChanged(isConfirmed: confirmedSwitch.isOn, isCancelled: cancelledSwitch.isOn)
    }
    

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
    
    func statusChanged(isConfirmed: Bool, isCancelled: Bool){
        let updateAppointment: UpdateAppointmentInteractor = UpdateAppointmentIntImpl()
        updateAppointment.execute(token: token,
                                  id: appointment.id,
                                  isConfirmed: isConfirmed,
                                  isCancelled: isCancelled,
                                  onSuccess: { (ok, msg) in
                                    if (ok == true){
                                        //self.alertSuccessControllerToView(message: msg)
                                    }
        },
                                  onError: { (errorMessage) in
                                    self.alertControllerToView(message: errorMessage)
        })
    }
    
    
    
    
    

   

}
