//
//  AppoitmentViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

class AppoitmentViewController: UIViewController {
    
    var appointment: AppointmentDomain!
    
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7Il9pZCI6IjVhOWYwNTRmNjAyZGQwZTU0MGM3MWJjNiIsImZlbGxvd3NoaXBOdW1iZXIiOjMzLCJnZW5kZXIiOiJtYWxlIiwibmFtZSI6ImFsYW4iLCJsYXN0TmFtZSI6ImNhc2FzIiwiZW1haWwiOiJmaXNpb0BpbnZhbGlkLmNvbSIsInBhc3N3b3JkIjoiZWY3OTdjODExOGYwMmRmYjY0OTYwN2RkNWQzZjhjNzYyMzA0OGM5YzA2M2Q1MzJjYzk1YzVlZDdhODk4YTY0ZiIsImFkZHJlc3MiOiJBdi4gRmVsaXBlIElJLCBzL24iLCJwaG9uZSI6IjYyNjYyNjYyNiIsImJpcnRoRGF0ZSI6IjE5NzgtMTItMzBUMTI6MzA6MDAuMDAwWiIsIm5hdGlvbmFsSWQiOiIxMjM0NTY3OFoiLCJyZWdpc3RyYXRpb25EYXRlIjoiMjAxOC0wMS0wMVQwMTowMTowMC4wMDBaIiwibGFzdExvZ2luRGF0ZSI6IjIwMTgtMDMtMDdUMTY6MDA6MDAuMDAwWiIsIl9fdiI6MCwiZGVsZXRlZCI6ZmFsc2UsImlzUHJvZmVzc2lvbmFsIjp0cnVlfSwiaWF0IjoxNTI0NjAyMTczLCJleHAiOjE1MjQ3NzQ5NzN9.E9XGqRy3_YOhdwVJvF1Ar6UfHfueK8UoJVl1iTx6uH8"
    
    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var customer: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var extraInfo: UILabel!
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
        
        let mapURL = "http://maps.googleapis.com/maps/api/staticmap?center=\(appointment.latitude),\(appointment.longitude)&zoom=16&size=320x220&scale=2&markers=color:blue%7C\(appointment.latitude),\(appointment.longitude)"
        let url = URL(string: mapURL)
        var imageData = NSData(contentsOf: url!)
        var image = #imageLiteral(resourceName: "map_placeholder.gif")
        if (imageData != nil){
            image = UIImage.init(data: imageData! as Data)!
        }
        
        map.image = image
        let customerName = appointment.customer.name + " " + appointment.customer.lastName
        customer.text = customerName
        address.text = appointment.address
        price.text = "\(appointment.service.price)€"
        confirmedSwitch.isOn = appointment.isConfirmed
        cancelledSwitch.isOn = appointment.isCancelled
        //extraInfo.text = appointment.extraInfo
        
        if (appointment.extraInfo == "false"){
            extraInfo.text = "No extra info provided"
        } else {
            extraInfo.text = appointment.extraInfo
        }
        
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
                                        self.alertSuccessControllerToView(message: msg, completionHandler: nil)
                                    }
        },
                                  onError: { (errorMessage) in
                                    self.alertControllerToView(message: errorMessage)
        })
    }
    
    
    
    
    

   

}
