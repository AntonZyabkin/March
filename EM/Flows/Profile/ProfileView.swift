//
//  ProfileView.swift
//  EM
//
//  Created by Anton Zyabkin on 15.03.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State private var image: Image = Image(asset: Asset.eye)
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    private let profileElements = [
        ProfileElement(icon: Asset.Profile.folder, title: L10n.Profile.tradeStore, isEditable: true),
        ProfileElement(icon: Asset.Profile.folder, title: L10n.Profile.paymentMethod, isEditable: true),
        ProfileElement(icon: Asset.Profile.folder, title: L10n.Profile.balance, aditionalInfo: "1593", isEditable: false),
        ProfileElement(icon: Asset.Profile.folder, title: L10n.Profile.tradeHistory, isEditable: true),
        ProfileElement(icon: Asset.Profile.refrash, title: L10n.Profile.restorePurchase, isEditable: true),
        ProfileElement(icon: Asset.Profile.help, title: L10n.Profile.help, isEditable: false),
        ProfileElement(icon: Asset.Profile.logOut, title: L10n.Profile.logOut, isEditable: false)
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.pageBackground
                .ignoresSafeArea()
            
//                        GeometryReader { Geometry in
//                            ZStack  {
//                                Image("3")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .edgesIgnoringSafeArea(.all)
//            //                        .opacity(0.8)
//                            }
//                        }
            VStack {
                //MARK: - main views
                VStack(alignment: .center) {
                    Text(L10n.Profile.title)
                        .font(.montserrat(.bold, size: 17))
                        .foregroundColor(.darkGray)
                        .padding(.top, 21)
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
                    
                    Text("MyName is Emenem")
                        .font(.montserrat(.bold, size: 17))
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    
                    Button {
                        //
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
                
                //MARK: - List of options
                //TODO: как лучше реализовать данный список опций?
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(profileElements) { element in
                        Button {
                            //
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
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct OptionView: View {
    var data: ProfileElement
    var body: some View {
        HStack {
            Image(asset: data.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22, alignment: .center)
                .padding(11)
                .background(Color.iconBackground)
                .cornerRadius(.infinity)
            Text(data.title)
            Spacer()
            if data.isEditable {
                Image(asset: Asset.Profile.arrow)
            }
            if let additionalInfo = data.additionalInfo {
                Text("$ \(additionalInfo)")
            }
        }
    }
}

struct ProfileElement: Identifiable {
    let id = UUID()
    let icon: ImageAsset
    let title: String
    let additionalInfo: String?
    let isEditable: Bool
    
    init(icon: ImageAsset, title: String, aditionalInfo: String?, isEditable: Bool) {
        self.icon = icon
        self.title = title
        self.additionalInfo = aditionalInfo
        self.isEditable = isEditable
    }
    init(icon: ImageAsset, title: String, isEditable: Bool) {
        self.icon = icon
        self.title = title
        self.additionalInfo = nil
        self.isEditable = isEditable
    }
}
