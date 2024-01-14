//
//  ShoppingListViewModel.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 14/01/24.
//
import SwiftData
import Foundation
import SwiftUI

struct ShoppingListViewModel {
    @Query private var shoppingItems: [ShoppingItem]
    @Environment(\.modelContext) var modelContext
    
    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(shoppingItems[index])
        }
    }
    
}
