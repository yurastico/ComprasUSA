//
//  ContentView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ShoppingListView()
                .tabItem {
                    Label("Compras", systemImage: "cart.circle")
                }
            SettingsView()
                .tabItem { Label("Ajustes",systemImage: "gear.circle") }
            TotalPurchaseView()
                .tabItem {
                    Label("Total da compra",systemImage: "dollarsign.circle")
                }
            
        }
    }
}

#Preview {
    MainTabView()
}
