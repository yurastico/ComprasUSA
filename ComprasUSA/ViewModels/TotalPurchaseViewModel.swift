//
//  TotalPurchaseViewModel.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 25/01/24.
//

import SwiftUI
import SwiftData
import Observation
import Foundation

@Observable
final class TotalPurchaseViewModel {
    private var dollar: Decimal
    private var iof: Decimal
    
    var shoppingItems: [ShoppingItem]
    
    init(dataSource: ShoppingItemsDataSource = ShoppingItemsDataSource.shared) {
        self.shoppingItems = dataSource.fetchItems()
        
        // tentativa de ler os valors do appstorage
        self.dollar = Decimal(UserSettings.dollar.wrappedValue)
        self.iof = Decimal(UserSettings.iof.wrappedValue)
    }
    
    var totalPurchase: Decimal {
        return shoppingItems.reduce(0) { $0 + $1.price }
    }
    
    var totalWithTaxes: Decimal {
        var total: Decimal = 0
        for item in shoppingItems {
            var taxitem: Decimal = item.price + item.price * (item.taxState / 100)
            if item.isCreditCard {
                taxitem = taxitem + taxitem * (iof / 100)
                total += taxitem
            }
        }
        return total
    }
    
    var purchaseInReals: Decimal {
        return totalWithTaxes * dollar
    }
    
    
    func updateSummary() {
        iof = Decimal(UserSettings.iof.wrappedValue)
        dollar = Decimal(UserSettings.dollar.wrappedValue)

    }
    
}
