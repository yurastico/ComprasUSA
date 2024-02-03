//
//  SettingsView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI

enum UserSettings {
    static let iof = AppStorage(wrappedValue: 0.049, "IOF")
    static let dollar = AppStorage(wrappedValue: 5.38, "dollar")
}

struct SettingsView: View {
    @AppStorage("dollar") private var dollar: Double = 0.049
    @AppStorage("IOF") private var iof: Double = 5.38
    var body: some View {
        NavigationStack {
            Form {
                Section("Cotação do dólar (R$)") {
                    TextField("R$ 0.0",value: $dollar, format: .percent)
                        .keyboardType(.decimalPad)
                }
                
                Section("IOF (%)") {
                    TextField("0.0",value: $iof, format: .number)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Ajustes")
        }
    }
}

#Preview {
    SettingsView()
}



