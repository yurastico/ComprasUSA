//
//  TotalPurchaseView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI
struct TotalPurchaseView: View {
    private var viewModel = TotalPurchaseViewModel()
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    Text("Valor dos produtos ($)")
                    Text("\(viewModel.totalPurchase.currencyUSD)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.blue)
                }
                
                VStack(alignment: .leading) {
                    Text("Total com impostos ($)")
                    
                    Text("\(viewModel.totalWithTaxes.currencyUSD)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.red)
                }
                VStack(alignment: .leading) {
                    Text("Valor final em reais")
                    Text("\(viewModel.purchaseInReals.currencyBRL)")
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
        .onAppear {
            viewModel.updateSummary()
        }
    }
}

#Preview {
    TotalPurchaseView()
}
