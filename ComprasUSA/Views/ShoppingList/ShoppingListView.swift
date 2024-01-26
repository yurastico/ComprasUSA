//
//  ShoppingListView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI

enum NavigationType: Hashable {
    case form
    case edit(ShoppingItem)
}

struct ShoppingListView: View {
    @State private var path = NavigationPath()
    @State private var viewModel = ShoppingListViewModel()
    
    init(path: NavigationPath = NavigationPath(), viewModel: ShoppingListViewModel = ShoppingListViewModel()) {
        self.path = path
        self.viewModel = viewModel
        viewModel.refreshItems()
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if viewModel.shoppingItems.isEmpty {
                    Text("Sua lista de compras está vazia")
                        .font(.title3)
                        .fontWeight(.medium)
                        .italic()
                } else {
                    List {
                        ForEach(viewModel.shoppingItems) { item in
                            NavigationLink(value: NavigationType.edit(item)) {
                                ShoppingListRow(product: item)
                            }
                        }
                        .onDelete(perform: viewModel.deleteItem)
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
}

#Preview {
    ShoppingListView()
}
