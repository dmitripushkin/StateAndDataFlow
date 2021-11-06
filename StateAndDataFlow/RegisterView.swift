//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Повелитель on 06.11.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var userName = ""
    @EnvironmentObject private var user: UserManager
    
    private let isDisabled = true
    
    var body: some View {
        VStack(spacing: 20) {
            CustomTextField(userName: $userName)
            OkButton(
                action: registerUser,
                isDisabled: userName.count < 3 ? isDisabled : !isDisabled
            )
        }
        .padding()
    }
    
    private func registerUser() {
        if !userName.isEmpty {
            user.name = userName
            user.isRegistered.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct OkButton: View {
    let action: () -> Void
    let isDisabled: Bool
    
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "checkmark.circle")
                Text("OK")
            }
        }
        .disabled(isDisabled)
    }
}

struct CustomTextField: View {
    @Binding var userName: String
    
    var body: some View {
        HStack {
            TextField("Enter your name...", text: $userName)
                .multilineTextAlignment(.center)
            Text("\(userName.count)")
                .font(.title3)
                .frame(width: 30)
                .foregroundColor(userName.count < 3 ? .red : .green)
        }
    }
}
