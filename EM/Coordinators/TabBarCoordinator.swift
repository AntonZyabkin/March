//
//  TabBarCoordinator.swift
//  EM
//
//  Created by Anton Zyabkin on 20.03.2023.
//

import SwiftUI
import FlowStacks

struct TabBarCoordinator: View {
    
    @ObservedObject var viewModel: TabBarCoordinatorViewModel
    
    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .tabBar(let viewModel):
                TabBarView(viewModel: viewModel)
            }
        }
    }
}
class TabBarCoordinatorViewModel: ObservableObject {
    
    @Published var routes: Routes<Screen> = []
    
    let decoderService: DecoderService
    let networkService: NetworkService
    let keyChainService: KeychainService
    let showAuthCoordinarot: () -> Void
    let shopApiService: ShopAPIService
    init(decoderService: DecoderService, networkService: NetworkService, keyChainService: KeychainService, showAuthCoordinarot: @escaping () -> Void) {
        self.decoderService = decoderService
        self.networkService = networkService
        self.keyChainService = keyChainService
        self.showAuthCoordinarot = showAuthCoordinarot
        self.shopApiService = ShopAPIService(networkService: networkService)
        self.routes = [.root(.tabBar(TabBarViewModel(showAuthCoordinarot: showAuthCoordinarot, decoderService: decoderService, networkService: networkService, keyChainService: keyChainService, shopApiService: shopApiService)))]

    }
    
    enum Screen {
        case tabBar(TabBarViewModel)
    }
}
