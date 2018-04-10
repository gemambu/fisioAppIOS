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
    
    var arrayOfAnimal: [DummyModel] = []
    let Juancho: DummyModel = DummyModel(name: "Juancho", comment: "Lagarto", image: #imageLiteral(resourceName: "lizard"))
    let Pepe: DummyModel = DummyModel(name: "Pepe", comment: "Perros", image: #imageLiteral(resourceName: "dogMassage"))
    let Cami: DummyModel = DummyModel(name: "Cami", comment: "Camaleon", image: #imageLiteral(resourceName: "camaleon"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Productos"

        arrayOfAnimal.append(Juancho)
        arrayOfAnimal.append(Pepe)
        arrayOfAnimal.append(Cami)
        arrayOfAnimal.append(Juancho)
        arrayOfAnimal.append(Pepe)
        arrayOfAnimal.append(Cami)
        arrayOfAnimal.append(Juancho)
        arrayOfAnimal.append(Pepe)
        arrayOfAnimal.append(Cami)
        arrayOfAnimal.append(Juancho)
        arrayOfAnimal.append(Pepe)
        arrayOfAnimal.append(Cami)
        arrayOfAnimal.append(Juancho)
        arrayOfAnimal.append(Pepe)
        arrayOfAnimal.append(Cami)
        arrayOfAnimal.append(Juancho)
        arrayOfAnimal.append(Pepe)
        arrayOfAnimal.append(Cami)
        
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfAnimal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let animalToShow = arrayOfAnimal[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellID, for: indexPath) as! ProductsViewCell
        
        cell.backgroundColor = UIColor.orange
        
        cell.imageView.image = animalToShow.image
        cell.nameLabel.text = animalToShow.name
        cell.commentLabel.text = animalToShow.comment
        
        return cell
    }
    
}
