//
//  ProductDetailView.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/11/21.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var shop: Shop
    @State var selectedProduct = sampleProduct

    @State var productRating: Int?
    @State var confirmationMessage = ""
    @State var showingConfirmation = false
  

    var body: some View {
      VStack(alignment: .leading, spacing: 5, content: {
        //NAVBAR
        NavigationBarDetailView()
          .padding(.horizontal)
          .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

        //HEADER
        HeaderDetailView()
          .padding(.horizontal)

        //DETAIL TOP PART
        TopPartDetailView()
          .padding(.horizontal)
          .zIndex(1)

        //DETAIL BOTTOM PART

        VStack(alignment: .center, spacing: 0, content: {
          //RATINGS = SIZES

          RatingsSizesDetailView(productRating: $productRating)
            .padding(.top, -20)
            .padding(.bottom, 10)
          
          //DESCRIPTION
          ScrollView(.vertical, showsIndicators: false, content: {
            Text(shop.selectedProduct?.description ?? sampleProduct.description)
              .font(.system(.body, design: .rounded))
              .foregroundColor(.gray)
              .multilineTextAlignment(.leading)
          }) //: SCROLL

          //QUANTITY = FAVOURITES
          QuantityFavouriteDetailVIew()
            .padding(.vertical, 10)

          //ADD TO CART
          Button(action: {
            Task {
              await placeOrder()
            }
          }, label: {
            Spacer()
            Text("ADD TO CART")
              .font(.system(.title2, design: .rounded))
              .fontWeight(.bold)
              .foregroundColor(.white)
            Spacer()
          })
            .onAppear(perform: intializeVariable)
            .padding()
            .background(
              Color(
                red: selectedProduct.red,
                green: selectedProduct.green,
                blue: selectedProduct.blue
              )
            )
            .clipShape(Capsule())

          Spacer()

        })
          .padding(.horizontal)
          .background(
            Color.white.clipShape(CustomShape())
              .padding(.top, -105)
          )

      }) //: VSTACK
        .ignoresSafeArea(.all, edges: .all)
        .background(
          Color(
            red: shop.selectedProduct?.red ?? sampleProduct.red,
            green: shop.selectedProduct?.green ?? sampleProduct.green,
            blue: shop.selectedProduct?.blue ?? sampleProduct.blue
          )
        ).ignoresSafeArea(.all, edges: .all)
        .zIndex(0)
        .alert("Thank You" ,isPresented: $showingConfirmation) {
          Button("OK") { }
        } message: {
          Text(confirmationMessage)
        }
    }

  func intializeVariable() {
    selectedProduct = shop.selectedProduct ?? sampleProduct
  }


  func placeOrder() async {
    guard let encoded = try? JSONEncoder().encode(selectedProduct) else {
            print("Failed to encode order")
            return
        }

        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

      do {
        let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

        let decodedOrder = try JSONDecoder().decode(Product.self, from: data)
        confirmationMessage = "You ordered " + decodedOrder.name + " for $ \(decodedOrder.price) is on it's way"
        showingConfirmation = true
      } catch {
        print("Checkout failed.")
      }
  }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
        .environmentObject(Shop())
        .previewLayout(.fixed(width: 375, height: 812))
    }
}
