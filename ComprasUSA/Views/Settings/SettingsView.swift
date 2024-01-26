//
//  SettingsView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI

enum UserSettings {
    static let iof = AppStorage(wrappedValue: 0.0, "IOF")
    static let dollar = AppStorage(wrappedValue: 0.0, "dollar")
}

struct SettingsView: View {
    @AppStorage("dollar")
    private var dollar = 0.0
    @AppStorage("IOF")
    private var iof = 0.0
    var body: some View {
        NavigationStack {
            Form {
                Section("Cotação do dólar (R$)") {
                    TextField("R$ 0.0",value: $dollar, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                
                Section("IOF (%)") {
                    TextField("0.0",value: $iof, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Ajustes")
        }
    }
}

#Preview {
    SettingsView()
}
