//
//  UserNamager.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mamlygo on 17.07.23.
//

import Foundation

class UserManager: ObservableObject {
    @Published var isRegistered = false
    var name = ""
}
