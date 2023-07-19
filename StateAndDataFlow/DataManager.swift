//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mamlygo on 19.07.23.
//

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        guard let user = user else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        withAnimation {
            userManager.user.isRegistered = false
            userManager.user.name = ""
            userData = nil
        }
    }
}
