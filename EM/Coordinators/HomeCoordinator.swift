//
//  HomeCoordinator.swift
//  EM
//
//  Created by Anton Zyabkin on 23.03.2023.
//

import SwiftUI
import Combine
import FlowStacks

struct HomeCoordinator: View {
    @ObservedObject var viewModel: HomeCoordinatorViewModel
    
    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .home(let viewModel):
                HomeView(viewModel: viewModel)
            case .itemPage(let viewModel):
                ItemPageView(viewModel: viewModel)
            }
        }
    }
}
@MainActor
class HomeCoordinatorViewModel: ObservableObject {
    
    enum Screen {
        case home(HomeViewModel)
        case itemPage(ItemPageViewModel)
    }
    @Published var routes: Routes<Screen> = []
    
    let shopApiService: ShopAPIService
    var tabBarSelection: TabBarItem

    init(networkService: NetworkService, tabBarSelection: TabBarItem) {
        self.tabBarSelection = tabBarSelection
        self.shopApiService = ShopAPIService(networkService: networkService)
        routes = [.root(.home(HomeViewModel(shopApiService: shopApiService, showItemPage: showItemPage)))]
    }
    
    func showItemPage(_ item: FlashSaleItem) {
        routes.push(.itemPage(ItemPageViewModel(shopApiService: shopApiService, goToCart: goToCart)))
    }
    func goToCart() {
        tabBarSelection = .cart
        routes.pop()
    }
}
