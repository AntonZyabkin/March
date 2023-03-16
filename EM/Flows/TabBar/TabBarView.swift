//
//  TabBarView.swift
//  EM
//
//  Created by Anton Zyabkin on 16.03.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var tabBarSelection: TabBarItem = .home
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            CustonTabBarContainerView(selection: $tabBarSelection) {
                HomeView()
                    .tabBatItem(tab: .home, selection: $tabBarSelection)
                FavoritesView()
                    .tabBatItem(tab: .favorites, selection: $tabBarSelection)
                BasketView()
                    .tabBatItem(tab: .basket, selection: $tabBarSelection)
                MessageView()
                    .tabBatItem(tab: .message, selection: $tabBarSelection)
                ProfileView()
                    .tabBatItem(tab: .profile, selection: $tabBarSelection)
            }
            .ignoresSafeArea()

        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
