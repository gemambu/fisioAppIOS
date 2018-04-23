//
//  ProductsViewController.swift
//  fisioapp
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

let productCellID = "ProductsViewCell"

class ProductsViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    @IBOutlet weak var addButton: UIButton!
    @IBAction func buttonClick(_ sender: UIButton) {
        let detailVC = ProductViewController()
        self.present(detailVC, animated: true, completion: nil)
    }
    
    var itemsArray: [Catalog] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        title = "Productos"
        tabBarItem.image = #imageLiteral(resourceName: "009-horizontal-4")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (!CustomUserDefaults.checkToken()) {
            checkLogin()
        }
        
        title = "Productos"
        
        getProductList()
        
        let frame = CGRect(x: 16, y: 16, width: self.view.frame.width, height: self.view.frame.height)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: frame.width , height: 200)
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView!.register(UINib(nibName: "ProductsViewCell", bundle: nil), forCellWithReuseIdentifier: productCellID)
        collectionView.backgroundColor = UIColor.white
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
    
    func getProductList() {
        
        let getProductListInteractor: GetProductsInteractor = GetProductsIntImpl()
        
        getProductListInteractor.execute(token: CustomUserDefaults.token,
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemsArray[indexPath.row]
        let detailVC = ProductViewController()
        detailVC.loadProductInfo(product: item)
        self.present(detailVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let itemToDisplay = itemsArray[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellID, for: indexPath) as! ProductsViewCell
        
        cell.backgroundColor = UIColor.white
        
        //   cell.imageView.image = itemToDisplay.image
        cell.nameLabel.text = itemToDisplay.name
        cell.commentLabel.text = "\(itemToDisplay.price) €"
        
        return cell
    }
    
}

// MARK: - checkLogin
extension ProductsViewController {
    func checkLogin()  {
        if let navigator = navigationController {
            navigator.pushViewController(LoginAndRegisterController(), animated: false)
        }
    }
}









