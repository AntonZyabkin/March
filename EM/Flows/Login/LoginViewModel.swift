//
//  LoginViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//

import SwiftUI
import FlowStacks

final class LoginViewModel: ObservableObject {
    
    @Published var isValidData = true
    @Published var passwordIsHidden = true
    @Published var firstName = ""
    @Published var password = ""

    let showHomeView: () -> Void
    let completeFlow: () -> Void
    
    private let keychainServise: KeychainServicable
    
    init(showHomeView: @escaping () -> Void, completeFlow: @escaping () -> Void, keychainServise: KeychainServicable) {
        print("LoginViewModel init")
        
        self.showHomeView = showHomeView
        self.completeFlow = completeFlow
        self.keychainServise = keychainServise
    }
    
    
    func loginButtonDidPress() {
        guard let user = keychainServise.fetchUser(for: firstName) else {
            isValidData = false
            return
        }
        if user.email.lowercased() == password.lowercased() {
            showHomeView()
        } else {
            isValidData = false
        }
    }
    
}
