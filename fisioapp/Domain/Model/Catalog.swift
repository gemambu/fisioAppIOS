//
//  Catalog.swift
//  fisioapp
//
//  Created by Gema Martinez on 20/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

public class Catalog {
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var professional: UserData
    var price: Float = 0
    var isActive: Int = 0
    var type: String = ""
    
    
    public init(id: String, name: String, description: String, price: Float, professional: UserData, isActive: Int, type: String){
        (self.id, self.name, self.description, self.price, self.professional, self.isActive, self.type) = (id, name, description, price, professional, isActive, type)
    }
}
