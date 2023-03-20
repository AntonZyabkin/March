//
//  LoginView.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        ZStack(alignment: .top) {
            Color.pageBackground
                .ignoresSafeArea()
            GeometryReader { Geometry in
                ZStack  {
                    Image("2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.5)
                }
            }
            VStack(alignment: .center) {
                Text(L10n.Login.title)
                    .font(.montserrat(.bold, size: 28))
                    .padding(.bottom, 75)
                    .padding(.top, 120)
                VStack(alignment: .center, spacing: 35) {
                    Group {
                        TextField(L10n.Login.first, text: $viewModel.firstName)
                        ZStack(alignment: .trailing) {
                            if viewModel.passwordIsHidden {
                                SecureField(L10n.Login.password, text: $viewModel.password)
                            } else {
                                TextField(L10n.Login.password, text: $viewModel.password)
                            }
                            Button {
                                viewModel.passwordIsHidden.toggle()
                            } label: {
                                if viewModel.passwordIsHidden {
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
                AttentionText(message: L10n.Login.wrongMessage, isVisible: !viewModel.isValidData)
                .padding(.bottom, 78)
                Button {
                    viewModel.loginButtonDidPress()
                } label: {
                    Text(L10n.Button.logIn)
                        .blueButtonModifier()
                }
            }
            .padding(.horizontal, 48)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(showHomeView: {}, completeFlow: {}, keychainServise: KeychainService(decoder: DecoderService())))
    }
}
