//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mamlygo on 17.07.23.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
