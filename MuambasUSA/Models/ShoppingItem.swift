//
//  ShoppingItem.swift
//  MuambasUSA
//
//  Created by Yuri Cunha on 20/12/23.
//

import Foundation

struct ShoppingItem: Identifiable {
    let id = UUID()
    let name: String
    let taxState: Double
    let price: Double
    let isCreditCard: Bool
    let image: Data
    
}
