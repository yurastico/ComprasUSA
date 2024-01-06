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
    @Bindable var product: ShoppingItem
    @State private var selectedProductImage: PhotosPickerItem?
    @State private var productImageData: Data?
    
    init(product: ShoppingItem? = nil,path: Binding<NavigationPath>) {
        self._path = path
        self.product = product ?? ShoppingItem()
    }
    
    
    var body: some View {
        Form {
            Section("NOME DO PRODUTO") {
                TextField("Escreva o nome do produto",text: $product.name)
            }
            
            Section("IMPOSTO DO ESTADO") {
                TextField("Escreva o imposto do estado",value: $product.taxState,formatter: NumberFormatter())
            }
            
            Section("VALOR DO PRODUTO") {
                TextField("Escreva custo do produto",value: $product.price,formatter: NumberFormatter())
            }
            
            Section("MEIO DE PAGAMENTO") {
                Toggle("Pagou com cartão?", isOn: $product.isCreditCard)
            }
            
            Section("FOTO") {
                PhotosPicker(selection: $selectedProductImage) {
                    Label("Escolher foto", systemImage: "giftcard.fill")
                }
                .onChange(of: selectedProductImage) {
                    Task {
                        productImageData = try? await selectedProductImage?.loadTransferable(type: Data.self)
                        product.image = productImageData
                    
                        
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
            modelContext.insert(product)
                
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
    ShoppingFormView(product: .init(), path: .init(projectedValue: .constant(.init())))
}
