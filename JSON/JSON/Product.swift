//
//  Product.swift
//  JSON
//
//  Created by Jacob Paul Hassler on 11/30/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//

import UIKit

class Products: Codable {
    let products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
}

class Product: Codable {
    let id: String
    let category:String
    let title:String
    let price:String
    let stockedQuantity:String
    
    init(id:String, category:String, title:String, price:String, stockedQuantity:String) {
        self.id = id
        self.category = category
        self.title = title
        self.price = price
        self.stockedQuantity = stockedQuantity
    }
}
