//
//  Shop.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 25/11/21.
//

import Foundation

class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? = nil
}
