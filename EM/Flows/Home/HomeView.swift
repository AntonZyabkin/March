//
//  HomeView.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var toggle = false
    var viewModel: HomeViewModelProtocol?
    var body: some View {
        ZStack(alignment: .top) {
            Color.pageBackground
                .ignoresSafeArea()
            
            GeometryReader { Geometry in
                ZStack  {
                    Image("4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    //                        .opacity(0.8)
                }
            }
        }
        
    }
}
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
