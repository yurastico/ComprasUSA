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
    @State private var isFieldEmpty = false
    var buttonLabel: String
    private let viewModel = ShoppingFormViewModel()
    
    init(product: ShoppingItem? = nil,path: Binding<NavigationPath>) {
        self._path = path
        buttonLabel = product == nil ? "Cadastrar" : "Editar"
        self.product = product ?? ShoppingItem()
    }
    
    
    var body: some View {
        Form {
            Section {
                TextField("Escreva o nome do produto",text: $product.name)
            } header: {
                Text("NOME DO PRODUTO")
            } footer: {
                isRequiredText(fieldText: product.name)
            }

            
            Section {
                TextField("Escreva o imposto do estado",value: $product.taxState,format: .number)
                    .keyboardType(.decimalPad)
            } header: {
                Text("IMPOSTO DO ESTADO")
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
        Section {
            ItemImagePicker(productImageData: $product.image)
                .onChange(of: productImageData) {
                    product.image = productImageData
                }
        } header: {
            Text("FOTO")
        } footer: {
            if isFieldEmpty &&
                productImageData == nil {
                Text("Este campo é obrigatório!")
                    .foregroundStyle(.red)
            }
        }
    }
    var saveButton: some View {
        Button {
            let isFieldsValid = viewModel.saveItem(product)
            if isFieldsValid {
                path.removeLast()
                
                isFieldEmpty = false
            } else {
                withAnimation {
                    isFieldEmpty = true
                }
            }
        } label: {
            Text(buttonLabel)
                .frame(maxWidth: .infinity,maxHeight: 30)
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    @ViewBuilder
    func isRequiredText(fieldText: String) -> some View {
        if isFieldEmpty &&
            fieldText.isEmpty {
            Text("Este campo é obrigatório!")
                .foregroundStyle(.red)
        }
        
    }
    
}

#Preview {
    ShoppingFormView(product: .init(), path: .init(projectedValue: .constant(.init())))
}
