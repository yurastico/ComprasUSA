//
//  ShoppingFormViewModel.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 25/01/24.
//

import Foundation
import Observation

@Observable
final class ShoppingFormViewModel {
    private let dataSource: ShoppingItemsDataSource
    
    init(dataSource: ShoppingItemsDataSource = ShoppingItemsDataSource.shared) {
        self.dataSource = dataSource
    }
    
    func saveItem(_ item: ShoppingItem) -> Bool {
        let name = item.name
        let taxState = item.taxState
        let price = item.price
        let image = item.image
        
        if name.isEmpty || taxState <= 0.0 || price <= 0.0 || image == nil {
            return false
        }
        
        
        dataSource.addItem(for: item)
        return true
    }
}
