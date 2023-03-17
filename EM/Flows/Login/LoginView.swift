//
//  LoginView.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var firstName = ""
    @State private var password = ""
    @State private var isHidden = true

    var body: some View {
        ZStack(alignment: .top) {
            Color.pageBackground
                .ignoresSafeArea()
//            GeometryReader { Geometry in
//                ZStack  {
//                    Image("2")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .edgesIgnoringSafeArea(.all)
//                        .opacity(0.5)
//                }
//            }
            VStack(alignment: .center) {
                Text(L10n.Login.title)
                    .font(.montserrat(.bold, size: 28))
                    .padding(.bottom, 75)
                    .padding(.top, 120)
                VStack(alignment: .center, spacing: 35) {
                    Group {
                        TextField(L10n.Login.first, text: $password)
                        ZStack(alignment: .trailing) {
                            if isHidden {
                                SecureField(L10n.Login.password, text: $password)
                            } else {
                                TextField(L10n.Login.password, text: $password)
                            }
                            Button {
                                isHidden.toggle()
                            } label: {
                                if isHidden {
                                    Image(asset: Asset.eye)
                                } else {
                                    Image(asset: Asset.eye1)
                                }
                            }
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.mainGray)
                            .padding(.trailing, 10)
                        }
                    }
                    .textFieldModifier()
                }
                .padding(.bottom, 100)
                Button {
                    //
                } label: {
                    Text(L10n.Button.logIn)
                        .blueButtonModifier()
                }
            }
            .padding(.horizontal, 48)
            
        }
    }
    
    func singInButtons(_ image: ImageAsset, title: String) -> some View {
        HStack {
            Image(asset: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.montserrat(.regular, size: 15))
        }
        .foregroundColor(.black)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
