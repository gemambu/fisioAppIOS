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
    var price: Int = 0
    
    public init(databaseID: String, name: String, description: String, price: Int){
        (self.databaseID, self.name, self.description, self.price) = (databaseID, name, description, price)
    }
}


