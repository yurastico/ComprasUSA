//
//  ShoppingFormView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI
import PhotosUI
struct ShoppingFormView: View {
    @Binding var path: NavigationPath
    @Environment(\.modelContext) var modelContext
    @State private var productName = ""
    @State private var stateTax = 0.0
    @State private var productPrice = 0.0
    @State private var isCreditCard = false
    @State private var selectedProductImage: PhotosPickerItem?
    @State private var productImageData: Data?
    
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
                Toggle("Pagou com cartão?", isOn: $isCreditCard)
            }
            
            Section("FOTO") {
                PhotosPicker(selection: $selectedProductImage) {
                    Label("Escolher foto", systemImage: "giftcard.fill")
                }
                .onChange(of: selectedProductImage) {
                    Task {
                        productImageData = try? await selectedProductImage?.loadTransferable(type: Data.self)
                    
                        
                    }
                    
                }
                
                if let productImageData,
                    let uiImage = UIImage(data: productImageData){
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
        .navigationTitle("Cadastro de produto")
        
        Button {
            var item = ShoppingItem(name: productName, taxState: stateTax, price: productPrice, isCreditCard: isCreditCard, image: Data())
            modelContext.insert(item)
                
            path.removeLast()
        } label: {
            Text("Cadastrar")
                .frame(maxWidth: .infinity,maxHeight: 30)
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

#Preview {
    ShoppingFormView(path: .constant(.init()))
}
