//
//  QuantityFavouriteDetailVIew.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 24/11/21.
//

import SwiftUI

struct QuantityFavouriteDetailVIew: View {
    @State var counter = 1
    @State var isHeart: Bool = false


    var body: some View {
      HStack(alignment: .center, spacing: 6, content: {
        Button(action: {
          if counter > 0 {
            counter -= 1
          }
        }, label: {
          Image(systemName: "minus.circle")
        })

        Text("\(counter)")
          .fontWeight(.semibold)
          .frame(minWidth: 36)

        Button(action: {
          if counter < 100 {
            counter += 1
          }
        }, label: {
          Image(systemName: "plus.circle")
        })

        Spacer()

        if isHeart {
          Button(action: {
            isHeart.toggle()
            feedback.impactOccurred()
          }, label: {
            Image(systemName: "heart.fill")
              .foregroundColor(.pink)
          })
        } else {
          Button(action: { isHeart.toggle() }, label: {
            Image(systemName: "heart")
              .foregroundColor(.pink)
          })
        }

      }) //: HSTACK
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

struct QuantityFavouriteDetailVIew_Previews: PreviewProvider {
    static var previews: some View {
      QuantityFavouriteDetailVIew()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
