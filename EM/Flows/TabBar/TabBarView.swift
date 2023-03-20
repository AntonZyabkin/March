//
//  TabBarView.swift
//  EM
//
//  Created by Anton Zyabkin on 16.03.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var viewModel: TabBarViewModel

    @State private var tabBarSelection: TabBarItem = .home
    var body: some View {
        ZStack {
            CustonTabBarContainerView(selection: $tabBarSelection) {
                HomeView(viewModel: HomeViewModel(shopApiService: viewModel.shopApiService))
                    .tabBatItem(tab: .home, selection: $tabBarSelection)
                FavoritesView()
                    .tabBatItem(tab: .favorites, selection: $tabBarSelection)
                BasketView()
                    .tabBatItem(tab: .basket, selection: $tabBarSelection)
                MessageView()
                    .tabBatItem(tab: .message, selection: $tabBarSelection)
                ProfileView(viewModel: ProfileViewModel(logOut: viewModel.showAuthCoordinarot))
                    .tabBatItem(tab: .profile, selection: $tabBarSelection)
            }
            .ignoresSafeArea()
        }
    }
}
