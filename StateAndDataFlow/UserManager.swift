//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Повелитель on 06.11.2021.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegistered = false
    var name = ""
}
