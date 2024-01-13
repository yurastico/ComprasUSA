//
//  TotalPurchaseView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI
import SwiftData
struct TotalPurchaseView: View {
    @AppStorage("IOF") var iof: Double = 0.0
    @Query private var shoppingItems: [ShoppingItem]
    var totalPurchase: Double {
        shoppingItems.reduce(0) { $0 + $1.price }
        
    }
    
    var totalWithTaxes: Double {
        return shoppingItems.reduce(into: 0) { result,item in
            result = result + (item.price * (item.taxState / 100))
            if item.isCreditCard {
                result = result * (iof / 100)
            }
            
        }
       
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    Text("Valor dos produtos ($)")
                    Text("\(totalPurchase)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.blue)
                }
                
                VStack(alignment: .leading) {
                    Text("Total com impostos ($)")
                    
                    Text("$ 1,168.00")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.red)
                }
                VStack(alignment: .leading) {
                    Text("Valor final em reais")
                    Text("R$ 4.500,00")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.green)
                }
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
            .navigationTitle("Resumo da compra")
            Spacer()
        }
    }
}

#Preview {
    TotalPurchaseView()
}
