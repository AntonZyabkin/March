//
//  RegistrationView.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.pageBackground
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .center) {
                    Text(L10n.Reg.title)
                        .font(.montserrat(.bold, size: 30))
                        .padding(.bottom, 75)
                        .padding(.top, 120)
                    VStack(alignment: .center, spacing: 10) {
                        Group {
                            TextField(L10n.Reg.first, text: $viewModel.firstName)
                                .textFieldModifier()
                            AttentionText(message: L10n.Reg.enterFirstName, isVisible: !viewModel.isValidFirstName)
                            
                            TextField(L10n.Reg.last, text: $viewModel.lastName)
                                .textFieldModifier()
                            AttentionText(message: L10n.Reg.enterLastName, isVisible: !viewModel.isValidLastName)
                            
                            TextField(L10n.Reg.email, text: $viewModel.email)
                                .textFieldModifier()
                            ZStack{
                                AttentionText(message: L10n.Reg.invalidEmail, isVisible: !viewModel.isValidEmailFunc())
                                AttentionText(message: "User name \(viewModel.firstName) is already busy", isVisible: viewModel.isEmailInBase)
                            }
                        }
                    }
                    Button {
                        viewModel.signInButtonDidPress()
                    } label: {
                        Text(L10n.Button.signIn)
                            .blueButtonModifier()
                    }
                    .padding(.bottom, 8)
                    .opacity(viewModel.isValidFields() ? 1 : 0.5)
                    .disabled(!viewModel.isValidFields())
                    
                    HStack() {
                        Text(L10n.Reg.haveAccount)
                            .font(.montserrat(.light, size: 11))
                            .foregroundColor(.mainGray)
                        Button {
                            viewModel.showLoginView()
                        } label: {
                            Text(L10n.Button.logIn)
                                .font(.montserrat(.light, size: 11))
                                .foregroundColor(.buttonForegrounds)
                        }
                    }
                    .padding(.bottom, 75)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                }
                .padding(.horizontal, 48)
                
                VStack(alignment: .trailing) {
                    Button {
                        //
                    } label: {
                        singInButtons(Asset.google, title: L10n.Button.signInGoogle)
                            .frame(height: 28)
                            .frame(maxWidth: .infinity)

                    }
                    .padding(.bottom, 30)
                    Button {
                        //
                    } label: {
                        singInButtons(Asset.apple, title: L10n.Button.signInApple)
                            .frame(height: 28)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.leading, 110)
            }
        }
    }
    
    func singInButtons(_ image: ImageAsset, title: String) -> some View {
        HStack {
            Image(asset: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.montserrat(.regular, size: 14))
            Spacer()
        }
        .foregroundColor(.black)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel(showLoginView: {}, showHomeView: {}, completeFlow: {}, keychainServise: KeychainService(decoder: DecoderService())))
    }
}
