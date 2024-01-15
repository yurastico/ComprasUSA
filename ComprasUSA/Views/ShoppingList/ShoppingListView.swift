//
//  ShoppingListView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI
import SwiftData
enum NavigationType: Hashable {
    case form
    case edit(ShoppingItem)
}

struct ShoppingListView: View {
    @Query private var shoppingItems: [ShoppingItem]
    @State private var path = NavigationPath()
    
    
    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if shoppingItems.isEmpty {
                    Text("Sua lista de compras está vazia")
                        .font(.title3)
                        .fontWeight(.medium)
                        .italic()
                        
                } else {
                    List {
                        ForEach(shoppingItems) { item in
                            NavigationLink(value: NavigationType.edit(item)) {
                                ShoppingListRow(product: item)
                            }
                          

                        }
                        .onDelete(perform: deleteItem)
                    }
                }
            }
            .navigationTitle("Lista de compras")
            .navigationDestination(for: NavigationType.self) { type in
                switch type {
                case .form:
                    ShoppingFormView(path: $path)
                case .edit(let item):
                    ShoppingFormView(product: item, path: $path)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        path.append(NavigationType.form)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        
    }
    private func deleteItem(at offsets: IndexSet) {
        
        
    }
}


#Preview {
    ShoppingListView()
}
