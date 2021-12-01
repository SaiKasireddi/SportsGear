//
//  ProductItemView.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/11/21.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product

    var body: some View {
      VStack(alignment: .leading, spacing: 6, content: {
        ZStack {
          Image(product.image)
            .resizable()
            .scaledToFit()
          .padding(10)
        }
        .background(Color(red: product.red, green: product.green, blue: product.blue))
        .cornerRadius(12)

        Text(product.name)
          .font(.title3)
          .fontWeight(.black)

        Text("$\(product.price)")
          .fontWeight(.semibold)
          .foregroundColor(Color.gray)

      }) //: VSTACK

    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: products[0])
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)

    }
}
