//
//  RegistrationViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//
import SwiftUI
import FlowStacks


final class RegistrationViewModel: ObservableObject {
    
    let showLoginView: () -> Void
    let showHomeView: () -> Void
    let completeFlow: () -> Void

    private let keychainServise: KeychainServicable
    
    init(showLoginView: @escaping () -> Void, showHomeView: @escaping () -> Void, completeFlow: @escaping () -> Void, keychainServise: KeychainServicable) {
        print("RegistrationViewModel init")

        self.showLoginView = showLoginView
        self.showHomeView = showHomeView
        self.completeFlow = completeFlow
        self.keychainServise = keychainServise
    }
    
    func loginButtonDidPress() {
        showLoginView()
    }
    
    func signInButtonDidPress() {
        completeFlow()
    }
    
    deinit {
        print("RegistrationViewModel")
    }
}


