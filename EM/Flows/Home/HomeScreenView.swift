//
//  HomeScreenView.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var toggle = false
    var viewModel: HomeViewModelProtocol?
    var body: some View {
        VStack {
            Button {
                toggle.toggle()
            } label: {
                if toggle {
                    Image("eye")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .background(Color.ikonActiveForeground)
                        .foregroundColor(.red)

                } else {
                    Image("eye 1")
                        .resizable()
                        .frame(width: 100, height: 70)
                        .aspectRatio(contentMode: .fit)
                        .background(Color.ikonActiveForeground)
                        .foregroundColor(.red)

                }
            }
            
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .foregroundColor(Color.pink)
                .padding(.horizontal, 10)
            
            
            Color(asset: Asset.accentColor)
            Button("ловмлывм", action: {
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
