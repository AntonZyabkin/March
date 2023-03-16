//
//  HomeView.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    
    @State private var selectedView = 1
    
    
    
    var viewModel: HomeViewModelProtocol?
    var body: some View {
        ZStack(alignment: .top) {
            Color.gray
                .ignoresSafeArea()
            
//            GeometryReader { Geometry in
//                ZStack  {
//                    Image("4")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .edgesIgnoringSafeArea(.all)
//                        .opacity(0.3)
//                }
//            }
        }
    }
}
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
