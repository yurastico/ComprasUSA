//
//  ItemImagePicker.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 03/02/24.
//

import SwiftUI
import PhotosUI
struct ItemImagePicker: View {
    @State private var selectedProductImage: PhotosPickerItem?
    @Binding var productImageData: Data?
    @State private var image: Image?
    var body: some View {
        Group {
            PhotosPicker(selection: $selectedProductImage) {
                Label("Escolher foto", systemImage: "giftcard.fill")
            }
            .onChange(of: selectedProductImage) {
                Task {
                    productImageData = try? await selectedProductImage?.loadTransferable(type: Data.self)
                    if let productImageData,
                       let uiImage = UIImage(data: productImageData){
                        image = Image(uiImage: uiImage)
                        
                    }
                }
            }
            
            if let image {
                image
                    .resizable()
                    .frame(height: 200)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
        }
        .onAppear {
            if let productImageData,
               let uiImage = UIImage(data: productImageData) {
                image = Image(uiImage: uiImage)
            }
        }
        
    }
}

#Preview {
    ItemImagePicker(productImageData: .constant(nil))
}
