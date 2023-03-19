//
//  AuthCoordinator.swift
//  EM
//
//  Created by Anton Zyabkin on 19.03.2023.
//

import SwiftUI
import FlowStacks

struct AuthCoordinator: View {
    
    @ObservedObject var viewModel: AuthCoordinatorViewModel
    
    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .registration(let viewModel):
                RegistrationView(viewModel: viewModel)
            case .login(let viewModel):
                LoginView(viewModel: viewModel)
            }
        }
    }
}
class AuthCoordinatorViewModel: ObservableObject {
    enum Screen {
        case registration(RegistrationViewModel)
        case login(LoginViewModel)
    }
    
    let showHome: () -> Void
    let keyChainService: KeychainService
    @Published var routes: Routes<Screen> = []
    
    init(decoder: DecoderService, showHome: @escaping () -> Void) {
        self.keyChainService = KeychainService(decoder: decoder)
        self.showHome = showHome
        self.routes = [.root(.registration(RegistrationViewModel(showLoginView: showLoginView, showHomeView: showHomeView, completeFlow: completeFlow, keychainServise: keyChainService)))]
    }
    
    func showLoginView() {
        routes.presentCover(.login(LoginViewModel(showHomeView: showHomeView, completeFlow: completeFlow, keychainServise: keyChainService)))
    }
    
    func showHomeView() {
        completeFlow()
    }
    func completeFlow() {
        RouteSteps.withDelaysIfUnsupported(self, \.routes) {
            $0.goBackToRoot()
        }
        showHome()
    }
    
    //    private func completeFlow() {
    //        Task { @MainActor in
    //            await $routes.withDelaysIfUnsupported {
    //                $0.goBackToRoot()
    //            }
    //            showHome()
    //        }
    //    }
}
