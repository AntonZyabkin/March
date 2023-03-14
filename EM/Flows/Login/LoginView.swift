//
//  LoginView.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    var body: some View {
        ZStack {
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
                    VStack(alignment: .center, spacing: 35) {
                        Group {
                            TextField(L10n.Reg.first, text: $firstName)
                            TextField(L10n.Reg.last, text: $lastName)
                            TextField(L10n.Reg.email, text: $email)
                        }
                        .textFieldStyle()
                    }
                    Button {
                        //
                    } label: {
                        Text(L10n.Button.signIn)
                            .font(.montserrat(.bold, size: 15))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    .frame(width: .infinity, height: 52)
                    .foregroundColor(.white)
                    .background(Color.buttonBackground)
                    .cornerRadius(15)
                    .padding(.top, 35)
                    .padding(.bottom, 8)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                    
                    HStack() {
                        Text(L10n.Reg.haveAccount)
                            .font(.montserrat(.light, size: 12))
                            .foregroundColor(.mainGray)
                        Button {
                            //
                        } label: {
                            Text(L10n.Button.logIn)
                                .font(.montserrat(.light, size: 12))
                                .foregroundColor(.buttonForegrounds)
                        }
                    }
                    .padding(.bottom, 74)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                }
                .padding(.horizontal, 43)
                
                VStack(alignment: .leading) {
                    Button {
                        //
                    } label: {
                        HStack {
                            Image(asset: Asset.google)
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                            Text(L10n.Button.signInGoogle)
                                .font(.montserrat(.regular, size: 15))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.bottom, 35)
                    Button {
                        //
                    } label: {
                        HStack {
                            Image(asset: Asset.apple)
                                .resizable()
                                .frame(width: 25, height: 30, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                            Text(L10n.Button.signInApple)
                                .font(.montserrat(.regular, size: 15))
                        }
                        .foregroundColor(.black)
                    }
                    
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
