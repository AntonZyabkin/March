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
        Color(UIColor.red)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
