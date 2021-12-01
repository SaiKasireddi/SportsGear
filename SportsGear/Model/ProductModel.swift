//
//  ProductModel.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/11/21.
//

import Foundation
import SwiftUI

class Product: Codable, Identifiable {

  let id: Int
  let name: String
  let image: String
  let price: Int
  let description: String
  let color: [Double]

  var red: Double { return color[0] }
  var green: Double { return color[1] }
  var blue: Double { return color[2] }

  

  //var rating = 4
  //var size = 2

  //let sizes: [String] = ["XS", "S", "M", "L", "XL"]

  }
