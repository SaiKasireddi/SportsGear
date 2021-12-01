//
//  TopPartDetailView.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/11/21.
//

import SwiftUI

struct TopPartDetailView: View {
  @State private var isAnimating: Bool = false
  @EnvironmentObject var shop: Shop

    var body: some View {
      HStack(alignment: .center, spacing: 6, content: {
        //PRICE
        VStack(alignment: .leading, spacing: 6, content: {
          Text("Price")
            .fontWeight(.semibold)

          Text("$\(shop.selectedProduct?.price ?? sampleProduct.price)")
            .font(.largeTitle)
            .fontWeight(.black)
            .scaleEffect(1.35, anchor: .leading)
        })
          .offset(y: isAnimating ? -50 : -75)

        Spacer()

        //PHOTO
        Image(shop.selectedProduct?.image ?? sampleProduct.image)
          .resizable()
          .scaledToFit()
          .scaleEffect()
          .offset(y: isAnimating ? 0 : -35)
      }) //: HSTACK
        .onAppear(perform: {
          withAnimation(.easeOut(duration: 1)) {
            isAnimating.toggle()
          }
        })
    }
}

struct TopPartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView()
        .environmentObject(Shop())
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
