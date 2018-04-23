//
//  CDMapper.swift
//  fisioapp
//
//  Created by Gema Martinez on 23/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation
import CoreData

func mapEntityIntoEntityCD(context: NSManagedObjectContext, product: CatalogData) -> CatalogCD {
    
    let prodCD = CatalogCD(context: context)
    
    prodCD.id = product.databaseID
    prodCD.name = product.name
    prodCD.desc = product.description
    prodCD.price = product.price
    prodCD.active = product.isActive == 1
    prodCD.professionalId = product.professional.id
    prodCD.type = "PRODUCT"
    
    return prodCD
    
}

func mapEntityCDToEntity(item: CatalogCD) -> CatalogData? {
    
    let id = item.id
    let name = item.name
    let desc = item.desc
    let price = item.price
    let isActive = item.active
    let type = item.type
    let user = item.professionalId
    return CatalogData(databaseID: id!,
                       name: name!,
                       description: desc!,
                       price: price,
                       professional: mapUserCDToUser(user: user!),
                       isActive: isActive == true ? 1 : 0,
                       type: type!)
    
    
}

// TODO revisar este mapping!!!!!
func mapUserCDToUser(user: String) -> UserData {
    return UserData(id: user, name: "", lastName: "")
}
