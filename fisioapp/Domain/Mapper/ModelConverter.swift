//
//  ModelConverter.swift
//  fisioapp
//
//  Created by Gema Martinez on 22/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import Foundation

func convert(item: Catalog) -> CatalogData {
    return CatalogData(databaseID: item.id,
                       name: item.name,
                       description: item.description,
                       price: item.price,
                       professional: convert(user: item.professional),
                       isActive: item.isActive,
                       type: item.type)
}

func convert(user: User) -> UserData {
    return UserData(id: user.id, name: user.name, lastName: user.lastName)
}

func convert(user: UserData) -> User {
    return User(id: user.id, name: user.name, lastName: user.lastName)
}

func convert(item: CatalogData) -> Catalog {
    return Catalog(id: item.databaseID,
                       name: item.name,
                       description: item.description,
                       price: item.price,
                       professional: convert(user: item.professional),
                       isActive: item.isActive,
                       type: item.type)
}
