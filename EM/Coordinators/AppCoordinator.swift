//
//  AppCoordinator.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI

enum AppRoute {
    case auth
    case registerAccount
    case tabbar
}


final class AppCoordinator: ObservableObject {
    
    let decoderService: DecoderService
    let networkService: NetworkService
    let keyChainService: KeychainService
    
    @Published var page: MyPage = .home
    
    init() {
        decoderService = DecoderService()
        networkService = NetworkService(decoderService: decoderService)
        keyChainService = KeychainService(decoder: decoderService)
    }
    
    func auth() {
        
    }
    
    func registerAccount() {
        
    }
    
    func test() -> ProfileView {
        ProfileView()
    }
    
    func home() -> HomeView {
        let shopAPIService = ShopAPIService(networkService: networkService)
        let homeViewModel = HomeViewModel(shopApiService: shopAPIService, coordinator: self)
        var homeScreenView = HomeView()
        homeScreenView.viewModel = homeViewModel
        return homeScreenView
    }
}


enum MyPage: String, Identifiable, CaseIterable {
    case home, auth, registerAccount
    
    var id: String { self.rawValue }
}
