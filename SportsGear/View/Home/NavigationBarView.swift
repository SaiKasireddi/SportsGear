//
//  NavigationBarView.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 22/11/21.
//

import SwiftUI

extension Image {
  func navBarImage() -> some View {
    self
      .font(.title)
      .foregroundColor(.black)
  }
}

struct NavigationBarView: View {
    @State private var isAnimated = false

    var body: some View {
      HStack {
        Button(action: {}, label: {
          Image(systemName: "magnifyingglass")
            .navBarImage()
        }) //: BUTTON

        Spacer()

        LogoView()
          .opacity(isAnimated ? 1 : 0)
          .offset(x: 0, y: isAnimated ? 0 : -15)
          .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.5)) {
              isAnimated.toggle()
            }
          })

        Spacer()

        Button(action: {}, label: {
          ZStack {
            Image(systemName: "cart")
              .navBarImage()

            Circle()
              .fill(Color.red)
              .frame(width: 14, height: 14, alignment: .center)
              .offset(x: 13, y: -10)
          }
        })
      } //: HSTACK
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
        //.previewLayout(.sizeThatFits)
        .padding()
    }
}
