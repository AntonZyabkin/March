//
//  TabBarItem.swift
//  EM
//
//  Created by Anton Zyabkin on 16.03.2023.
//

import SwiftUI
enum TabBarItem: Hashable {
    case home, favorites, cart, message, profile
    
    var iconAsset: ImageAsset {
        switch self {
        case .home: return Asset.TabBar.homeTabBar
        case .favorites: return Asset.TabBar.favoritesTabBar
        case .cart: return Asset.TabBar.cartTabBar
        case .message: return Asset.TabBar.messageTabBar
        case .profile: return Asset.TabBar.profileTabBar
        }
    }
}
