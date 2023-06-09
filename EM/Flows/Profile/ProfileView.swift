//
//  ProfileView.swift
//  EM
//
//  Created by Anton Zyabkin on 15.03.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State private var image: Image = Image(asset: Asset.imageCover)
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                VStack(alignment: .center) {
                    Text(L10n.Profile.title)
                        .font(.montserrat(.bold, size: 17))
                        .foregroundColor(.black)
                        .padding(.top, 19)
                    ZStack {
                        Circle()
                            .stroke(Color.iconInactiveForeground, lineWidth: 4)
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(.infinity)
                            .clipShape(Circle())
                    }
                    .frame(width: 65, height: 65, alignment: .center)
                    .padding(.top, 5)
                    
                    Button {
                        self.shouldPresentImagePicker = true
                        self.shouldPresentCamera = false
                    } label: {
                        Text(L10n.Profile.changePhoto)
                            .font(.montserrat(.medium, size: 9))
                            .foregroundColor(.mainBlack)
                            .sheet(isPresented: $shouldPresentImagePicker) {
                                SUImagePickerView(sourceType: .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                            }
                    }
                    
                    Text("Satria Adhi Pradana")
                        .font(.montserrat(.bold, size: 17))
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    
                    Button {
                        //some action
                    } label: {
                        ZStack {
                            Image(asset: Asset.Profile.upload)
                                .resizable()
                                .offset(x: -96)
                                .frame(width: 14, height: 16)
                            Text(L10n.Profile.uploadItemButton)
                        }
                        .blueButtonModifier()
                    }
                    .padding(.top, 19)
                }
                .padding(.horizontal, 48)
                .padding(.top, 45)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        ForEach(ProfileElement.profileElements) { element in
                            Button {
                                viewModel.elementAction(element.type)()
                            } label: {
                                OptionView(data: element)
                            }
                            .font(.montserrat(.regular, size: 15))
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 5)
                    .padding(.leading, 36)
                    .padding(.trailing, 50)
                }
                
            }.background(Color.pageBackground.ignoresSafeArea())
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(logOut: {}))
    }
}


