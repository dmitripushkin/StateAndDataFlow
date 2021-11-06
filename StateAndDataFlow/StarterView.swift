//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Повелитель on 06.11.2021.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        Group {
            if user.isRegistered {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
