//
//  RegistrationView.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.pageBackground
                .ignoresSafeArea()
            
            
            
//            GeometryReader { Geometry in
//                ZStack  {
//                    Image("1")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .edgesIgnoringSafeArea(.all)
//                        .opacity(0.3)
//                }
//            }
            
            
            
            
            
            VStack {
                VStack(alignment: .center) {
                    Text(L10n.Reg.title)
                        .font(.montserrat(.bold, size: 30))
                        .padding(.bottom, 75)
                        .padding(.top, 120)
                    VStack(alignment: .center, spacing: 35) {
                        Group {
                            TextField(L10n.Reg.first, text: $firstName)
                            TextField(L10n.Reg.last, text: $lastName)
                            TextField(L10n.Reg.email, text: $email)
                        }
                        .textFieldModifier()
                    }
                    Button {
                        //
                    } label: {
                        Text(L10n.Button.signIn)
                            .blueButtonModifier()
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 8)
                    
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
                    .padding(.bottom, 70)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                }
                .padding(.horizontal, 48)
                
                VStack(alignment: .leading) {
                    Button {
                        //
                    } label: {
                        singInButtons(Asset.google, title: L10n.Button.signInGoogle)
                            .frame(height: 30)
                            .frame(maxWidth: .infinity)

                    }
                    .padding(.bottom, 28)
                    Button {
                        //
                    } label: {
                        singInButtons(Asset.apple, title: L10n.Button.signInApple)
                            .frame(height: 30)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.trailing, 10)
            }
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel(showLoginView: {}, showHomeView: {}, completeFlow: {}, keychainServise: KeychainService(decoder: DecoderService())))
    }
}
