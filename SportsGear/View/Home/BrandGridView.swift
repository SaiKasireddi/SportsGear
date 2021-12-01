//
//  BrandGridView.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/11/21.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false, content: {
        LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
          ForEach(brands) { brand in
            BrandItemView(brand: brand)
          }
        }) //: GRID
          .frame(height: 200)
          .padding(15)
      }) //: SCROLL
    }
}

struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
    }
}
