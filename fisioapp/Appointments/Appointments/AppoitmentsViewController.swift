//
//  AppoitmentsViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

let appoitmentsCellID = "AppoitmentsViewCell"

class AppoitmentsViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var datePicker: UIDatePicker!
    let refreshControl = UIRefreshControl()
    let dateFormatter = DateFormatter()
    
    var appointmentsForCV: [AppointmentDomain] = []
    lazy var selectedDate = String()
    
    
    
    let myToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7Il9pZCI6IjVhOWYwNTRmNjAyZGQwZTU0MGM3MWJjNiIsImZlbGxvd3NoaXBOdW1iZXIiOjMzLCJnZW5kZXIiOiJtYWxlIiwibmFtZSI6ImFsYW4iLCJsYXN0TmFtZSI6ImNhc2FzIiwiZW1haWwiOiJmaXNpb0BpbnZhbGlkLmNvbSIsInBhc3N3b3JkIjoiZWY3OTdjODExOGYwMmRmYjY0OTYwN2RkNWQzZjhjNzYyMzA0OGM5YzA2M2Q1MzJjYzk1YzVlZDdhODk4YTY0ZiIsImFkZHJlc3MiOiJBdi4gRmVsaXBlIElJLCBzL24iLCJwaG9uZSI6IjYyNjYyNjYyNiIsImJpcnRoRGF0ZSI6IjE5NzgtMTItMzBUMTI6MzA6MDAuMDAwWiIsIm5hdGlvbmFsSWQiOiIxMjM0NTY3OFoiLCJyZWdpc3RyYXRpb25EYXRlIjoiMjAxOC0wMS0wMVQwMTowMTowMC4wMDBaIiwibGFzdExvZ2luRGF0ZSI6IjIwMTgtMDMtMDdUMTY6MDA6MDAuMDAwWiIsIl9fdiI6MCwiZGVsZXRlZCI6ZmFsc2UsImlzUHJvZmVzc2lvbmFsIjp0cnVlfSwiaWF0IjoxNTI0NjAyMTczLCJleHAiOjE1MjQ3NzQ5NzN9.E9XGqRy3_YOhdwVJvF1Ar6UfHfueK8UoJVl1iTx6uH8"
    
    
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
        
        getAppointmentsForDate(date: selectedDate)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
