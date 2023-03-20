//
//  LoginViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//

import SwiftUI
import FlowStacks

final class LoginViewModel: ObservableObject {
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
        showHomeView()
    }
    deinit {
        print("LoginViewModel")
    }

}
