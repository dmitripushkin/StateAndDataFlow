//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Повелитель on 06.11.2021.
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
