//
//  CustonTabBarContainerView.swift
//  EM
//
//  Created by Anton Zyabkin on 16.03.2023.
//

import SwiftUI
struct CustonTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
//    @State private var tabs: [TabBarItem] = []
    @State private var tabs: [TabBarItem] = [.home, .message, .basket, .favorites, .profile]

    let content: Content
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
                VStack {
                    Spacer()
                    CustonTabBarView(tabs: tabs, selection: $selection)
                }
            }
        }
//        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
//            self.tabs = value
//        }
    }
}
