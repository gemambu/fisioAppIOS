//
//  AppointmentsExtension_DatePicker.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 23/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

extension AppoitmentsViewController {
    
    /******** DatePicker ********/
    func initializeDatePicker() {
        let datePickerFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/2)
        
        datePicker = UIDatePicker(frame: datePickerFrame)
        datePicker.datePickerMode = .date
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.selectedDate = dateFormatter.string(from: datePicker.date)
        
        datePicker.addTarget(self, action: #selector(selectedDate(sender:)), for: .allEvents)
    }
    
    
    @objc func selectedDate(sender: UIDatePicker){
        self.selectedDate = dateFormatter.string(from: datePicker.date)
        self.getAppointmentsForDate(date: self.selectedDate)
    }
 
    
    
    /******** GetAppointments from network ********/
    func getAppointmentsForDate(date: String){
        let getAppointmentsForDate: GetAppointmentsForDateInteractor = GetAppointmentsForDateIntImpl()
        
        getAppointmentsForDate.execute(token: myToken,
                                       date: date,
                                       onSuccess: { (appointmentsFromDomain: [AppointmentDomain]) in
                                        
                                        if (appointmentsFromDomain.count == 0) {
                                            self.appointmentsForCV.removeAll()
                                        } else {
                                            self.appointmentsForCV.removeAll()
                                            for appointment in appointmentsFromDomain {
                                                let appointment = appointment
                                                self.appointmentsForCV.append(appointment)
                                            }
                                        }
                                        self.collectionView.reloadData()
        },
                                       onError: { (msg: String) -> Void in
                                        print("Error: \(msg)")
                                        
        })
    }
    
}
