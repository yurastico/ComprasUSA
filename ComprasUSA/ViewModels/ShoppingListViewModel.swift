//
//  ShoppingListViewModel.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 14/01/24.
//
import SwiftData
import SwiftUI
import Observation

@Observable
final class ShoppingListViewModel {
    var shoppingItems: [ShoppingItem] = []
    private let dataSource: ShoppingItemsDataSource
    init(dataSource: ShoppingItemsDataSource = ShoppingItemsDataSource.shared) {
        self.dataSource = dataSource
        self.shoppingItems = dataSource.fetchItems()
    }
    
    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            dataSource.removeItem(shoppingItems[index])
        }
    }
    
    func refreshItems() {
       self.shoppingItems = dataSource.fetchItems()
    }

    
}

