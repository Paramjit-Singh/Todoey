//
//  Category.swift
//  Todoey
//
//  Created by Paramjit Singh on 21/09/2018.
//  Copyright © 2018 Paramjit Singh. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
