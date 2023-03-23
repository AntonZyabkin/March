//
//  AppCoordinator.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI
import FlowStacks


struct AppCoordinator: View {
    enum Screen {
        case authFlow
        case homeFlow
    }
    let decoderService: DecoderService
    let networkService: NetworkService
    let keyChainService: KeychainService
    @State var routes: Routes<Screen> = [.root(.authFlow)]

    init() {
        self.decoderService = DecoderService()
        self.networkService = NetworkService(decoderService: decoderService)
        self.keyChainService = KeychainService(decoder: decoderService)
    }
    
    var body: some View {
        Router($routes) { screen, _ in
            switch screen {
            case .authFlow:
                AuthCoordinator(viewModel:
                                    AuthCoordinatorViewModel(
                                        decoder: decoderService,
                                        showHome: showHomeCoordinarot))
            case .homeFlow:
                TabBarCoordinator(viewModel:
                                    TabBarCoordinatorViewModel(
                                        decoderService: decoderService,
                                        networkService: networkService,
                                        keyChainService: keyChainService,
                                        showAuthCoordinarot: showAuthCoordinarot))
            }
        }
    }
    
    func showHomeCoordinarot() {
        routes.removeAll()
        routes = [.root(.homeFlow)]
    }
    func showAuthCoordinarot() {
        routes.removeAll()
        routes = [.root(.authFlow)]
    }
}
