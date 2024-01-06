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
    let name: String
    let taxState: Double
    let price: Double
    let isCreditCard: Bool
    let image: Data
    
    init(name: String, taxState: Double, price: Double, isCreditCard: Bool, image: Data) {
        self.name = name
        self.taxState = taxState
        self.price = price
        self.isCreditCard = isCreditCard
        self.image = image
    }
    
}
