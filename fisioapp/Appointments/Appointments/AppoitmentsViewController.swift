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
    
    let myToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7Il9pZCI6IjVhOWYwNTRmNjAyZGQwZTU0MGM3MWJjNiIsImlzUHJvZmVzc2lvbmFsIjp0cnVlLCJmZWxsb3dzaGlwTnVtYmVyIjozMywiZ2VuZGVyIjoibWFsZSIsIm5hbWUiOiJmaXNpbyIsImxhc3ROYW1lIjoibGFzdG5hbWUiLCJlbWFpbCI6ImZpc2lvQGludmFsaWQuY29tIiwicGFzc3dvcmQiOiJlZjc5N2M4MTE4ZjAyZGZiNjQ5NjA3ZGQ1ZDNmOGM3NjIzMDQ4YzljMDYzZDUzMmNjOTVjNWVkN2E4OThhNjRmIiwiYWRkcmVzcyI6IkZpc2lvIEFkZHJlc3MsIDMzIiwicGhvbmUiOiI2MjY2MjY2MjYiLCJiaXJ0aERhdGUiOiIxOTcwLTEyLTMwVDEyOjMwOjAwLjAwMFoiLCJuYXRpb25hbElkIjoiMTIzNDU2NzhaIiwicmVnaXN0cmF0aW9uRGF0ZSI6IjIwMTgtMDEtMDFUMDE6MDE6MDAuMDAwWiIsImxhc3RMb2dpbkRhdGUiOiIyMDE4LTAzLTA3VDE2OjAwOjAwLjAwMFoiLCJfX3YiOjAsImRlbGV0ZWQiOmZhbHNlfSwiaWF0IjoxNTI0MDY1MDM2LCJleHAiOjE1MjQyMzc4MzZ9.5_ucNbvYSNGWYA4PrLDCMmeMoevGB8d-VPKm7qDLyeA"
    
    
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
        
        initializeDatePicker()
        initializeCollectionView()
        self.view.addSubview(collectionView)
        self.view.addSubview(datePicker)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /******** date picker ********/
    func initializeDatePicker() {
        
        let datePickerFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/2)
        
        datePicker = UIDatePicker(frame: datePickerFrame)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(selectedDate(sender:)), for: .allEvents)
    }
    
    
    @objc func selectedDate(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: datePicker.date)
        //print(date)
        self.getAppointmentsForDate(date: date)
    }
    
    
    
    /******** collection view ********/
    func initializeCollectionView() {
        
        let frame = CGRect(x: 0, y: self.view.frame.height/2, width: self.view.frame.width, height: self.view.frame.height)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: frame.width, height: 200)
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView!.register(UINib(nibName: "AppoitmentsViewCell", bundle: nil), forCellWithReuseIdentifier: appoitmentsCellID)
        collectionView.backgroundColor = UIColor.white
    }
    
    
    
    /******** get appointments ********/
    func getAppointmentsForDate(date: String){
        let getAppointmentsForDate: GetAppointmentsForDateInteractor = GetAppointmentsForDateIntImpl()
        
            getAppointmentsForDate.execute(token: myToken,
                                           date: date,
                                           onSuccess: { (appointmentsFromDomain: [AppointmentDomain]) in
                                            
                                                if (appointmentsFromDomain.count == 0) {
                                                    self.appointmentsForCV = []
                                                    self.collectionView.reloadData()
                                                } else {
                                                    for appointment in appointmentsFromDomain {
                                                        let appointment = self.appointmentMapper(appointment: appointment)
                                                        self.appointmentsForCV.append(appointment)
                                                        print(self.appointmentsForCV.count)
                                                    }
                                                    self.collectionView.reloadData()
                                                }
                                            },
                                           onError: { (msg: String) -> Void in
                                            print("Error: \(msg)")
                
            })
    }

    
    
}
