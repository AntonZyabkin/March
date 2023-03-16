//
//  TabBarItem.swift
//  EM
//
//  Created by Anton Zyabkin on 16.03.2023.
//

import SwiftUI
enum TabBarItem: Hashable {
    case home, favorites, basket, message, profile
    
    var icomAsset: ImageAsset {
        switch self {
        case .home: return Asset.TabBar.homeTabBar
        case .favorites: return Asset.TabBar.favoritesTabBar
        case .basket: return Asset.TabBar.basketTabBar
        case .message: return Asset.TabBar.messageTabBar
        case .profile: return Asset.TabBar.profileTabBar
        }
    }
}
