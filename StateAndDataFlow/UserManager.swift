//
//  UserNamager.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mamlygo on 17.07.23.
//

import SwiftUI


class UserManager: ObservableObject {
    @AppStorage("username") var name = ""
    
    func logOut() {
        withAnimation {
            name = ""
        }
    }
}
