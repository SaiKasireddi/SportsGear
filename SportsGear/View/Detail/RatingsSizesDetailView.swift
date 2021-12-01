//
//  RatingsSizesDetailView.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 24/11/21.
//

import SwiftUI

struct RatingsSizesDetailView: View {
    @EnvironmentObject var shop: Shop
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]

    //FOR STARS
    @Binding var productRating: Int?

    private func starType(index: Int) -> String {
      if let rating = self.productRating {
        return index <= rating ? "star.fill" : "star"
       } else {
      return "star"
    }
  }

    var body: some View {
      HStack(alignment: .top, spacing: 3, content: {
        //RATINGS
        VStack(alignment: .leading, spacing: 3, content: {
          Text("Ratings")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(colorGray)

          HStack(alignment: .center, spacing: 3, content: {
            ForEach(1...5, id: \.self) { item in
              Button(action: {
                self.productRating = item
              }, label: {
                Image(systemName: self.starType(index: item))
                  .frame(width: 28, height: 28, alignment: .center)
                  .foregroundColor(colorGold)
                  .background(Color.white.cornerRadius(5))
                  .background(
                    RoundedRectangle(cornerRadius: 5)
                      .stroke(colorGray, lineWidth: 1)
                  )
              })
            }
          })
        })

        Spacer()

        //SIZES
        VStack(alignment: .trailing, spacing: 3, content: {
          Text("Sizes")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(colorGray)

          HStack(alignment: .center, spacing: 5, content: {
            ForEach(sizes, id: \.self) { size in
              Button(action: {
                //self.selectedSize = true
              }, label: {
                Text(size)
                  .font(.footnote)
                  .fontWeight(.heavy)
                  //.modifier(productSize(selectedSize: $selectedSize))
                  .foregroundColor(colorGray)
                  .frame(width: 28, height: 28, alignment: .center)
                  .background(Color.white.cornerRadius(5))
                  .background(
                    RoundedRectangle(cornerRadius: 5)
                      .stroke(colorGray, lineWidth: 1)
                )
              })
            }
          })

        })
      }) //: HSTACK
    }
}

struct RatingsSizesDetailView_Previews: PreviewProvider {
    static var previews: some View {
      RatingsSizesDetailView(productRating: .constant(4))
        .environmentObject(Shop())
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
