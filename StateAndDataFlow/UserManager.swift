//
//  UserNamager.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mamlygo on 17.07.23.
//

import SwiftUI


class UserManager: ObservableObject {
    @AppStorage("username") var name = ""
    @AppStorage("isRegistered") var isRegistered = false
    
    var isInputValid: Bool {
        name.count >= 3
    }
    
    func logOut() {
        withAnimation {
            isRegistered = false
            name = ""
        }
    }
}
