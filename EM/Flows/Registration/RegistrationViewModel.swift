//
//  RegistrationViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//
import SwiftUI
import FlowStacks


final class RegistrationViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var isEmailInBase = false
    @Published var isValidFirstName = true
    @Published var isValidLastName = true
    
    let showLoginView: () -> Void
    let showHomeView: () -> Void
    let completeFlow: () -> Void
    
    private let keychainServise: KeychainServicable
    
    init(showLoginView: @escaping () -> Void, showHomeView: @escaping () -> Void, completeFlow: @escaping () -> Void, keychainServise: KeychainServicable) {
        self.showLoginView = showLoginView
        self.showHomeView = showHomeView
        self.completeFlow = completeFlow
        self.keychainServise = keychainServise
    }
    
    func loginButtonDidPress() {
        showLoginView()
    }
    
    func signInButtonDidPress() {
        isEmailInBase = firstNameIsBusy()
        isValidFirstName = isValidFirstNameFunc()
        isValidLastName = isValidLastNameFunc()
        guard !isEmailInBase else { return }
        let user = User(firstName: firstName, lastName: lastName, email: email)
        if keychainServise.save(user) {
            showHomeView()
        } else {
            print("Saving user error")
            //show error alert maiby
        }
    }
    
    //MARK: - Validation methods
    func firstNameIsBusy() -> Bool {
        keychainServise.fetchUser(for: firstName) == nil ? false : true
    }

    func isValidEmailFunc() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isValidFirstNameFunc() -> Bool {
        !(firstName.isEmpty || firstName.contains(" "))
    }
    
    func isValidLastNameFunc() -> Bool {
        !(lastName.isEmpty || lastName.contains(" "))
    }
    func isValidFields() -> Bool {
        if      !isValidFirstNameFunc() ||
                !isValidLastNameFunc() ||
                !isValidEmailFunc() {
            return false
        }
        return true
    }
}


