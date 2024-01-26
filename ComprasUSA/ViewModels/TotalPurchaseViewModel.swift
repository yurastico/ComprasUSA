//
//  TotalPurchaseViewModel.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 25/01/24.
//

import SwiftData
import Observation

@Observable
final class TotalPurchaseViewModel {
    private var dollar: Double = 0
    private var iof: Double = 0
    
    var shoppingItems: [ShoppingItem]
    
    init(dataSource: ShoppingItemsDataSource = ShoppingItemsDataSource.shared) {
        self.shoppingItems = dataSource.fetchItems()
    }
    
    var totalPurchase: Double {
        return shoppingItems.reduce(0) { $0 + $1.price }
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
    
    
    func updateSummary() {
        iof = UserSettings.iof.wrappedValue
        dollar = UserSettings.dollar.wrappedValue

    }
    
}
