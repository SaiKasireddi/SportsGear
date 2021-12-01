//
//  SportsGearApp.swift
//  SportsGear
//
//  Created by Sai Kumar Kasireddi's MacBook on 22/11/21.
//

import SwiftUI

@main
struct SportsGearApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(Shop())
        }
    }
}
