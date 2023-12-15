//
//  ShoppingListView.swift
//  MuambasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI

struct ShoppingListView: View {
    let shoppingItems = [String]()
    var body: some View {
        NavigationStack {
            Group {
                if shoppingItems.isEmpty {
                    Text("Sua lista de compras está vazia")
                        .font(.title3)
                        .fontWeight(.medium)
                        .italic()
                        
                } else {
                    List {
                        ForEach(shoppingItems,id: \.self) { item in
                            Text(item)
                        }
                        .onDelete(perform: deleteItem)
                    }
                }
            }
        }
        .navigationTitle("Lista de compras")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    private func deleteItem(at offsets: IndexSet) {
        print(#function)
    }
}


#Preview {
    ShoppingListView()
}
