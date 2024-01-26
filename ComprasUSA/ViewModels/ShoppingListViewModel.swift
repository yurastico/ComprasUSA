//
//  ShoppingListViewModel.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 14/01/24.
//
import SwiftData
import Foundation
import SwiftUI
import Observation
 
    @Observable
    final class ShoppingListViewModel: ObservableObject {
        var shoppingItems: [ShoppingItem] = []
        @ObservationIgnored
        private let dataSource: ShoppingItemsDataSource
        init(dataSource: ShoppingItemsDataSource = ShoppingItemsDataSource.shared) {
            self.dataSource = dataSource
            self.shoppingItems = dataSource.fetchItems()
        }
        
        func fetchItems() {
            do {
                let descriptor = FetchDescriptor<ShoppingItem>(sortBy: [SortDescriptor(\.price)])
                //self.shoppingItems = try modelContext.fetch(descriptor)
            } catch {
                print("fetch failed")
            }
            
        }
        
        func deleteItem(at offsets: IndexSet) {
            for index in offsets {
                //modelContext.delete(shoppingItems[index])
            }
        }
        
    }

