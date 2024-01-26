//
//  ShoppingItemsDataSource.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 25/01/24.
//


import SwiftData
import Observation

@Observable
final class ShoppingItemsDataSource {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = ShoppingItemsDataSource()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: ShoppingItem.self)
        self.modelContext = modelContainer.mainContext
        
    }
    
    func fetchItems() -> [ShoppingItem] {
        do {
            return try modelContext.fetch(FetchDescriptor<ShoppingItem>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addItem(for item: ShoppingItem) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            print("oops!")
        }
    }
    
    func removeItem(_ item: ShoppingItem) {
        modelContext.delete(item)
    }
}
