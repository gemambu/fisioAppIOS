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
    lazy var selectedDate = String()
    private let refreshControl = UIRefreshControl()
    
    let myToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7Il9pZCI6IjVhOWYwNTRmNjAyZGQwZTU0MGM3MWJjNiIsImZlbGxvd3NoaXBOdW1iZXIiOjMzLCJnZW5kZXIiOiJtYWxlIiwibmFtZSI6ImZpc2lvIiwibGFzdE5hbWUiOiJsYXN0bmFtZSIsImVtYWlsIjoiZmlzaW9AaW52YWxpZC5jb20iLCJwYXNzd29yZCI6ImVmNzk3YzgxMThmMDJkZmI2NDk2MDdkZDVkM2Y4Yzc2MjMwNDhjOWMwNjNkNTMyY2M5NWM1ZWQ3YTg5OGE2NGYiLCJhZGRyZXNzIjoiRmlzaW8gQWRkcmVzcywgMzMiLCJwaG9uZSI6IjYyNjYyNjYyNiIsImJpcnRoRGF0ZSI6IjE5NzAtMTItMzBUMTI6MzA6MDAuMDAwWiIsIm5hdGlvbmFsSWQiOiIxMjM0NTY3OFoiLCJyZWdpc3RyYXRpb25EYXRlIjoiMjAxOC0wMS0wMVQwMTowMTowMC4wMDBaIiwibGFzdExvZ2luRGF0ZSI6IjIwMTgtMDMtMDdUMTY6MDA6MDAuMDAwWiIsIl9fdiI6MCwiZGVsZXRlZCI6ZmFsc2UsImlzUHJvZmVzc2lvbmFsIjp0cnVlfSwiaWF0IjoxNTI0NDI1NDI0LCJleHAiOjE1MjQ1OTgyMjR9.tDNL_PydUzkvhffYGUer8mn4kh6fIe-rmDZ846RhaWk"
    
    
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
        self.view.addSubview(datePicker)
        self.view.addSubview(collectionView)
        
        
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
        //let date = dateFormatter.string(from: datePicker.date)
        //self.selectedDate = date
        self.selectedDate = dateFormatter.string(from: datePicker.date)
        self.getAppointmentsForDate(date: self.selectedDate)
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
        collectionView.refreshControl = self.refreshControl
        refreshControl.addTarget(self, action: #selector(refreshCVData(_:)), for: .valueChanged)
        
        collectionView!.register(UINib(nibName: "AppoitmentsViewCell", bundle: nil), forCellWithReuseIdentifier: appoitmentsCellID)
        collectionView.backgroundColor = UIColor.white
    }
    
    @objc func refreshCVData(_ sender: Any){
        self.appointmentsForCV.removeAll()
        getAppointmentsForDate(date: selectedDate)
        self.refreshControl.endRefreshing()
    }
    
    
    
    
    /******** get appointments ********/
    func getAppointmentsForDate(date: String){
        let getAppointmentsForDate: GetAppointmentsForDateInteractor = GetAppointmentsForDateIntImpl()
        
            getAppointmentsForDate.execute(token: myToken,
                                           date: date,
                                           onSuccess: { (appointmentsFromDomain: [AppointmentDomain]) in
                                            
                                                if (appointmentsFromDomain.count == 0) {
                                                    self.appointmentsForCV = []
                                                    //self.collectionView.reloadData()
                                                } else {
                                                    for appointment in appointmentsFromDomain {
                                                        let appointment = self.appointmentMapper(appointment: appointment)
                                                        self.appointmentsForCV.append(appointment)
                                                        print(self.appointmentsForCV.count)
                                                    }
                                                    //self.collectionView.reloadData()
                                                }
                                            self.collectionView.reloadData()
                                            },
                                           onError: { (msg: String) -> Void in
                                            print("Error: \(msg)")
                
            })
    }

    
    
}
