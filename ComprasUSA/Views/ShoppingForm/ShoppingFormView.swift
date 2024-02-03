//
//  ShoppingFormView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 15/12/23.
//

import SwiftUI
struct ShoppingFormView: View {
    @Binding var path: NavigationPath
    @Bindable var product: ShoppingItem
    
    @State private var productImageData: Data?
    var buttonLabel: String
    private let viewModel = ShoppingFormViewModel()
    
    init(product: ShoppingItem? = nil,path: Binding<NavigationPath>) {
        self._path = path
        buttonLabel = product == nil ? "Cadastrar" : "Editar"
        self.product = product ?? ShoppingItem()
    }
    
    
    var body: some View {
        Form {
            Section("NOME DO PRODUTO") {
                TextField("Escreva o nome do produto",text: $product.name)
            }
            
            
            
            Section("IMPOSTO DO ESTADO") {
                TextField("Escreva o imposto do estado",value: $product.taxState,format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section("VALOR DO PRODUTO") {
                TextField("Escreva custo do produto",value: $product.price,format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section("MEIO DE PAGAMENTO") {
                Toggle("Pagou com cartão?", isOn: $product.isCreditCard)
            }
            
            imagePicker
            
            
        }
        .navigationTitle("Cadastro de produto")
        
        saveButton
    }
    
    var imagePicker: some View {
        Section("FOTO") {
            ItemImagePicker(productImageData: $product.image)
                .onChange(of: productImageData) {
                    product.image = productImageData
                }
            
        }
    }
    var saveButton: some View {
        Button {
            let isFieldsValid = viewModel.saveItem(product)
            if isFieldsValid {
                path.removeLast()
            }
        } label: {
            Text(buttonLabel)
                .frame(maxWidth: .infinity,maxHeight: 30)
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

#Preview {
    ShoppingFormView(product: .init(), path: .init(projectedValue: .constant(.init())))
}
