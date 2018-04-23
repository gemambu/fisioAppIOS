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
    var appointmentsForCV: [AppointmentModel] = []
    lazy var selectedDate = String()
    let refreshControl = UIRefreshControl()
    
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
}
