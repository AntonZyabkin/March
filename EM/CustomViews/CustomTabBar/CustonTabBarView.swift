//
//  SwiftUIView.swift
//  EM
//
//  Created by Anton Zyabkin on 16.03.2023.
//

import SwiftUI

struct CustonTabBarView: View {
    
    let tabs: [TabBarItem]
    
    @Binding var selection: TabBarItem
    var body: some View {
        tabBarVersion
    }
}


extension CustonTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        Image(asset: tab.iconAsset)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20, alignment: .center)
            .padding(12)
            .foregroundColor(selection == tab ? .iconActiveForeground : .iconInactiveForeground)
            .background(selection == tab ? .iconBackground : Color.clear)
            .cornerRadius(.infinity)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
    }
    
    private var tabBarVersion: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        swifchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .padding(.bottom, 25)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .cornerRadius(25)
    }
    private func swifchToTab(tab: TabBarItem) {
        selection = tab
    }
}
