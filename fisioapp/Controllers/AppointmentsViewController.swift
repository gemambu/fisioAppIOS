//
//  AppointmentsViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

let appointmentsCellID = "AppointmentsViewCell"

class AppointmentsViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var datePicker: UIDatePicker!
    let refreshControl = UIRefreshControl()
    let dateFormatter = DateFormatter()
    
    var appointmentsForCV: [AppointmentDomain] = []
    lazy var selectedDate = String()
    
    
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
        
        if (!CustomUserDefaults.checkToken()) {
            checkLogin()
        }
        
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



// MARK: - checkLogin
extension AppointmentsViewController {
    func checkLogin()  {
        if let navigator = navigationController {
            navigator.pushViewController(LoginAndRegisterController(), animated: false)
        }
    }
}
