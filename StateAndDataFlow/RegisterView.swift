//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mamlygo on 17.07.23.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var isInputValid = false
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { isInputValid = $0.count >= 3 }
                    
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                }
                .disabled(!isInputValid)
            }
            
            Text(name.count.formatted())
                .frame(width: 40)
                .foregroundColor(isInputValid ? .black : .red)
        }
        .padding()
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userManager.name = name
            userManager.isRegistered.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
