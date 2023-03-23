//
//  TabBarViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 16.03.2023.
//

import Foundation
final class TabBarViewModel: ObservableObject {
    let showAuthCoordinarot: () -> Void
    @Published var tabBarSelection: TabBarItem = .home
    
    let decoderService: DecoderService
    let networkService: NetworkService
    let keyChainService: KeychainService
    let shopApiService: ShopAPIService

    init(showAuthCoordinarot: @escaping () -> Void, decoderService: DecoderService, networkService: NetworkService, keyChainService: KeychainService, shopApiService: ShopAPIService) {
        self.showAuthCoordinarot = showAuthCoordinarot
        self.decoderService = decoderService
        self.networkService = networkService
        self.keyChainService = keyChainService
        self.shopApiService = shopApiService
    }
    func changeTabBarScreen(screen: TabBarItem) {
        tabBarSelection = screen
    }
}
