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
    
    @IBOutlet weak var addButton: UIButton!
    @IBAction func buttonClick(_ sender: UIButton) {
        let detailVC = ServiceViewController()
        self.present(detailVC, animated: true, completion: nil)
    }
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
        collectionView.backgroundColor = UIColor.yellow
        self.view.addSubview(collectionView)
        self.view.addSubview(addButton)
        
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
        self.present(detailVC, animated: true, completion: nil)
    }
    
    func getServicesList() {
        
        let getListInteractor: GetServicesInteractor = GetServicesIntImpl()
        
        getListInteractor.execute(token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7Il9pZCI6IjVhOWYwNTRmNjAyZGQwZTU0MGM3MWJjNiIsImlzUHJvZmVzc2lvbmFsIjp0cnVlLCJmZWxsb3dzaGlwTnVtYmVyIjozMywiZ2VuZGVyIjoibWFsZSIsIm5hbWUiOiJmaXNpbyIsImxhc3ROYW1lIjoibGFzdG5hbWUiLCJlbWFpbCI6ImZpc2lvQGludmFsaWQuY29tIiwicGFzc3dvcmQiOiJlZjc5N2M4MTE4ZjAyZGZiNjQ5NjA3ZGQ1ZDNmOGM3NjIzMDQ4YzljMDYzZDUzMmNjOTVjNWVkN2E4OThhNjRmIiwiYWRkcmVzcyI6IkZpc2lvIEFkZHJlc3MsIDMzIiwicGhvbmUiOiI2MjY2MjY2MjYiLCJiaXJ0aERhdGUiOiIyMDE4LTA0LTA3VDEwOjI0OjU3LjAwMFoiLCJuYXRpb25hbElkIjoiMTIzNDU2NzhaIiwicmVnaXN0cmF0aW9uRGF0ZSI6IjIwMTgtMDEtMDFUMDE6MDE6MDAuMDAwWiIsImxhc3RMb2dpbkRhdGUiOiIyMDE4LTAzLTA3VDE2OjAwOjAwLjAwMFoiLCJfX3YiOjAsImRlbGV0ZWQiOmZhbHNlfSwiaWF0IjoxNTI0MzI0ODU4LCJleHAiOjE1MjQ0OTc2NTh9.zZPf99zuDDMy7DNXvD7qpL8WHyP8i5gNfQpsN6_0KB4",
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
