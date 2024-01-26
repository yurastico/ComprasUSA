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
    
    func saveItem(_ item: ShoppingItem) {
        dataSource.addItem(for: item)
    }
}
