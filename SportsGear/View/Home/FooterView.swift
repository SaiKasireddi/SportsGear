//
//  FooterView.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 22/11/21.
//

import SwiftUI

struct FooterView: View {
@State var isShowing = false

    var body: some View {
      VStack(alignment: .center, spacing: 10) {
        Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
          .padding(.top)


        Image("logo-lineal")
          .renderingMode(.template)

        VStack {
          HStack {
            Text("Copyright ©")
              .fontWeight(.bold)

            Text("Sai Kumar Kasireddi")
              .font(.body)
              .fontWeight(.black)
              .onTapGesture {
                self.isShowing = true
              }
          }
          Text("All rights reserved")
            .fontWeight(.bold)
        }
         .font(.footnote)
         .layoutPriority(1)

      } //: VSTACK
      .foregroundColor(.gray)
      //.padding()
      .sheet(isPresented: $isShowing) {
          AboutDeveloperView()
      }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
        .previewLayout(.sizeThatFits)
        .background(colorBackground)
    }
}
