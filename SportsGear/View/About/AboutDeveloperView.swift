//
//  AboutDeveloperView.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 25/11/21.
//

import SwiftUI

struct AboutDeveloperView: View {


    var body: some View {
      VStack(alignment: .leading) {
        Image("SaiKumarKasireddi")
          .resizable()
          .scaledToFit()
          .background(
            RoundedRectangle(cornerRadius: 10)
              .stroke(.black, lineWidth: 1)
          )


        VStack(alignment: .leading, spacing: 5, content: {
          Text("Sai Kumar Kasireddi")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.black)

          Link("GitHub", destination: URL(string: "https://github.com/SaiKasireddi")!)

          Link("LinkedIn", destination: URL(string: "https://www.linkedin.com/in/sai-kumar-kasireddi-a5328a213/")!)

          Link("Twitter", destination: URL(string: "https://twitter.com/SaiKasireddi")!)

        })
          .padding(.top, 20)

        Spacer()
      }
      .padding(.horizontal, 10)
      .background(colorBackground)
    }
}

struct AboutDeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        AboutDeveloperView()
    }
}
