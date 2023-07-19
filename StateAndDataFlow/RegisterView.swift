//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mamlygo on 17.07.23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                TextField("Enter your name...", text: $userManager.name)
                    .multilineTextAlignment(.center)
                    
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                }
                .disabled(!userManager.isInputValid)
            }
            
            Text(userManager.name.count.formatted())
                .frame(width: 40)
                .foregroundColor(userManager.isInputValid ? .green : .red)
        }
        .padding()
    }
    
    private func registerUser() {
        if !userManager.name.isEmpty {
            userManager.isRegistered = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
