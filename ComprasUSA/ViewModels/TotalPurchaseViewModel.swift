//
//  TotalPurchaseViewModel.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 25/01/24.
//

import Foundation
import SwiftData
import SwiftUI
struct TotalPurchaseViewModel {
    @AppStorage("IOF") var iof: Double = 0.0
    @AppStorage("dollar") var dollar: Double = 0.0
    @Query var shoppingItems: [ShoppingItem]
    
    var totalPurchase: Double {
        shoppingItems.reduce(0) { $0 + $1.price }
        
    }
    
    var totalWithTaxes: Double {
        var total: Double = 0
        for item in shoppingItems {
            var taxitem = item.price + item.price * (item.taxState / 100)
            if item.isCreditCard {
                taxitem = taxitem + taxitem * (iof / 100)
                total += taxitem
            }
        }
        return total
    }
    
    var purchaseInReals: Double {
        return totalWithTaxes * dollar
    }
    
    
}
