//
//  ServicesViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

let serviceCellID = "ServicesViewCell"

class ServicesViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    var itemsArray: [Catalog] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        title = "Servicios"
        tabBarItem.image = #imageLiteral(resourceName: "001-people")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(!CustomUserDefaults.checkToken()) {
            checkLogin()
        }
        
        title = "Servicios"
        
        getServicesList()
        
        let frame = CGRect(x: 16, y: 16, width: self.view.frame.width, height: self.view.frame.height)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: frame.width , height: 200)
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView!.register(UINib(nibName: "ServicesViewCell", bundle: nil), forCellWithReuseIdentifier: serviceCellID)
        collectionView.backgroundColor = UIColor.lightGray
        self.view.addSubview(collectionView)
        
        // New Service Button
        let addNewService = UIBarButtonItem(title: "New service", style: .plain, target: self, action: #selector(newServiceButtonClick))
        navigationItem.rightBarButtonItem = addNewService
        
    }
    
    @objc func newServiceButtonClick() {
        let detailVC = ServiceViewController()
        let tabBarDetailVC = UINavigationController(rootViewController: detailVC)
        self.present(tabBarDetailVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemsArray[indexPath.row]
        let detailVC = ServiceViewController()
        detailVC.loadServiceInfo(service: item)
        let tabBarDetailVC = UINavigationController(rootViewController: detailVC)
  
        self.present(tabBarDetailVC, animated: true, completion: nil)
    }
    
    func getServicesList() {
        
        let getListInteractor: GetServicesInteractor = GetServicesIntImpl()
        
        getListInteractor.execute(token: CustomUserDefaults.token,
                                         onSuccess: { (itemsFromDomain: [Catalog]) in
                                            if (itemsFromDomain.count == 0) {
                                                self.itemsArray = []
                                                self.collectionView.reloadData()
                                                
                                            } else {
                                                
                                                for product in itemsFromDomain {
                                                    self.itemsArray.append(product)
                                                }
                                                print(self.itemsArray.count)
                                                self.collectionView.reloadData()
                                            }
                                            
        },
                                         onError: { (msg: String) -> Void in
                                            print("Error: \(msg)")
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let itemToShow = itemsArray[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: serviceCellID, for: indexPath) as! ServicesViewCell
        
        cell.backgroundColor = UIColor.white
        
        cell.nameLabel.text = itemToShow.name
        cell.commentLabel.text = "\(itemToShow.price) €"
        
        return cell
    }
    
    
}

// MARK: - checkLogin
extension ServicesViewController {
    func checkLogin()  {
        if let navigator = navigationController {
            navigator.pushViewController(LoginAndRegisterController(), animated: false)
        }
    }
}









