//
//  SettingsView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var dollar = 0.0
    @State private var iof = 0.0
    var body: some View {
        NavigationStack {
            Form {
                Section("Cotação do dólar (R$)") {
                    TextField("R$ 0.0",value: $dollar, formatter: NumberFormatter())
                }
                
                Section("IOF (%)") {
                    TextField("0.0",value: $iof, formatter: NumberFormatter())
                }
            }
            .navigationTitle("Ajustes")
        }
    }
}

#Preview {
    SettingsView()
}
