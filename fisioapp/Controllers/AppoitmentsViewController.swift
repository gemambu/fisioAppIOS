//
//  AppoitmentsViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

let appoitmentsCellID = "AppoitmentsViewCell"

class AppoitmentsViewController: UIViewController, UICollectionViewDelegateFlowLayout  {
    
    var collectionView: UICollectionView!
    var datePicker: UIDatePicker!
    
    var appointmentsForCV: [AppointmentModel] = []
    let appointment1 = AppointmentModel(customer: "Alan Casas", address: "Goya # 15", isConfirmed: true, isCancelled: false, price: 35, lat: 40.451563, long: -3.866120)
    let appointment2 = AppointmentModel(customer: "Rodrigo Limpias", address: "Goya # 15", isConfirmed: true, isCancelled: false, price: 35, lat: 40.451563, long: -3.866120)
    let appointment3 = AppointmentModel(customer: "Gema Martínez", address: "Goya # 15", isConfirmed: true, isCancelled: false, price: 35, lat: 40.451563, long: -3.866120)
    let appointment4 = AppointmentModel(customer: "Carlos Company", address: "Goya # 15", isConfirmed: true, isCancelled: false, price: 35, lat: 40.451563, long: -3.866120)
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        title = "Citas"
        tabBarItem.image = #imageLiteral(resourceName: "008-call-center-worker-with-headset")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Citas"
        
        /*appointments.append(appointment1)
        appointments.append(appointment2)
        appointments.append(appointment3)
        appointments.append(appointment4)
        appointments.append(appointment1)
        appointments.append(appointment2)
        appointments.append(appointment3)
        appointments.append(appointment4)*/
        
        
        
        let frame = CGRect(x: 0, y: self.view.frame.height/2, width: self.view.frame.width, height: self.view.frame.height)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: frame.width, height: 200)
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView!.register(UINib(nibName: "AppoitmentsViewCell", bundle: nil), forCellWithReuseIdentifier: appoitmentsCellID)
        collectionView.backgroundColor = UIColor.white
        
        initializeDatePicker()
        self.view.addSubview(collectionView)
        self.view.addSubview(datePicker)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func initializeDatePicker() {
        
        let datePickerFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/2)
        
        datePicker = UIDatePicker(frame: datePickerFrame)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(selectedDate(sender:)), for: .allEvents)
    }
    
    @objc func selectedDate(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: datePicker.date)
        
        self.getAppointmentsForDate(date: date)
    }
    
    func getAppointmentsForDate(date: String){
        let getAppointmentsForDate: GetAppointmentsForDateInteractor = GetAppointmentsForDateIntImpl()
        
        let queue = OperationQueue()
        queue.addOperation {
            getAppointmentsForDate.execute(token: "",
                                           date: date,
                                           onSuccess: { (appointments: [Appointment]) in
                                            for appointment in appointments {
                                                let appointment = self.appointmentMapper(appointment: appointment)
                                                self.appointmentsForCV.append(appointment)
                                            }
                                        
            }, onError: { (msg: String) -> Void in
                
            })
        }
    }
    
    
    

}
