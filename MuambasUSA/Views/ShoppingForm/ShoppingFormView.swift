//
//  ShoppingFormView.swift
//  MuambasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI
import PhotosUI
struct ShoppingFormView: View {
    @State private var productName = ""
    @State private var stateTax = 0.0
    @State private var productPrice = 0.0
    @State private var isCreditCar = false
    @State private var prouctImage: PhotosPickerItem? = nil
    var body: some View {
        Form {
            Section("NOME DO PRODUTO") {
                TextField("Escreva o nome do produto",text: $productName)
            }
            
            Section("IMPOSTO DO ESTADO") {
                TextField("Escreva o imposto do estado",value: $stateTax,formatter: NumberFormatter())
            }
            
            Section("VALOR DO PRODUTO") {
                TextField("Escreva custo do produto",value: $productPrice,formatter: NumberFormatter())
            }
            
            Section("MEIO DE PAGAMENTO") {
                Toggle("Pagou com cartão?", isOn: $isCreditCar)
            }
            
            Section("FOTO") {
                PhotosPicker(selection: $prouctImage) {
                    Label("Escolher foto", systemImage: "giftcard.fill")
                }
               
            }
        }
        .navigationTitle("Cadastro de produto")
    }
}

#Preview {
    ShoppingFormView()
}
