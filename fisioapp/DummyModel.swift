//
//  Person.swift
//  CustomCellUsingXIB
//
//  Created by Alan Casas on 5/4/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

final class DummyModel {
    let name : String
    let comment: String
    let image: UIImage
    
    init(name: String, comment: String, image:UIImage) {
        (self.name, self.comment, self.image) = (name, comment, image)
    }
    
}
