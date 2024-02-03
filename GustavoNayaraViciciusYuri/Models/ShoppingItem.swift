//
//  ShoppingItem.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 20/12/23.
//

import Foundation
import SwiftData

@Model
final class ShoppingItem: Identifiable {
    let id = UUID()
    var name: String
    var taxState: Decimal
    var price: Decimal
    var isCreditCard: Bool
    var image: Data?
    
    init(name: String = "", taxState: Decimal = 0.0, price: Decimal = 0.0, isCreditCard: Bool = false, image: Data? = nil) {
        self.name = name
        self.taxState = taxState
        self.price = price
        self.isCreditCard = isCreditCard
        self.image = image
    }
    
}
