//
//  ShoppingListItemView.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 06/01/24.
//

import SwiftUI

struct ShoppingListRow: View {
    var product: ShoppingItem
    var body: some View {
        HStack {
            if let data = product.image,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50,height: 80)
                    .clipped()
                    .cornerRadius(8)
                    .shadow(radius: 4,x: 2,y: 2)
            }
            
            Text("\(product.name)")
            Text("\(product.price.currencyUSD)")
           
        }
    }
}

#Preview {
    ShoppingListRow(product: ShoppingItem())
}


