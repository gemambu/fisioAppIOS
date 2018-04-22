//
//  CatalogData.swift
//  fisioapp
//
//  Created by Rodrigo Limpias Cossio on 13/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

public class CatalogData {
    var databaseID: String = ""
    var name: String = ""
    var description: String = ""
    var price: Float = 0.0
    var professional: UserData
    var isActive: Int = 0
    var type: String
    
    public init(databaseID: String, name: String, description: String, price: Float, professional: UserData, isActive: Int, type: String){
        (self.databaseID, self.name, self.description, self.price, self.professional, self.isActive, self.type) = (databaseID, name, description, price, professional, isActive, type)
    }
}
