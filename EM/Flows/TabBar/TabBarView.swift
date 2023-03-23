//
//  TabBarView.swift
//  EM
//
//  Created by Anton Zyabkin on 16.03.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var viewModel: TabBarViewModel
    var body: some View {
        ZStack {
            CustonTabBarContainerView(selection: $viewModel.tabBarSelection) {
                HomeCoordinator(viewModel: HomeCoordinatorViewModel(networkService: viewModel.networkService, tabBarSelection: viewModel.tabBarSelection))
                    .tabBatItem(tab: .home, selection: $viewModel.tabBarSelection)
                FavoritesView()
                    .tabBatItem(tab: .favorites, selection: $viewModel.tabBarSelection)
                CartView()
                    .tabBatItem(tab: .cart, selection: $viewModel.tabBarSelection)
                MessageView()
                    .tabBatItem(tab: .message, selection: $viewModel.tabBarSelection)
                ProfileView(viewModel: ProfileViewModel(logOut: viewModel.showAuthCoordinarot))
                    .tabBatItem(tab: .profile, selection: $viewModel.tabBarSelection)
            }
            .ignoresSafeArea()
        }
        
    }
}
