//
//  HomeScreenView.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI

struct HomeScreenView: View {
    var viewModel: HomeViewModelProtocol?
    var body: some View {
        VStack {
            Color(asset: Asset.accentColor)
            Text(L10n.test)
                .font(.montserrat(.bold, size: 50))
            Text(L10n.test)
                .font(.montserrat(.medium, size: 30))
            Text(L10n.test)
                .font(.montserrat(.regular, size: 30))
            Text(L10n.test)
                .font(.montserrat(.light, size: 30))
            Button("привет", action: {
                print("test")
            })
            .font(.montserrat(.bold, size: 30))
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
