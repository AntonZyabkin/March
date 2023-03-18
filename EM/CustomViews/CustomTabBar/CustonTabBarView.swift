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

struct CustonTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [.home, .favorites, .basket, .message, .profile]
    static var previews: some View {
        VStack {
            Spacer()
            CustonTabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
        .background(Color.green)
        .ignoresSafeArea()
    }
}

extension CustonTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        Image(asset: tab.icomAsset)
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
