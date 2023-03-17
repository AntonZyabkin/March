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
            Color.pageBackground
                .ignoresSafeArea()
            GeometryReader { Geometry in
                ZStack  {
                    Image("4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(1)
                }
            }
            
            
            NavigationView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { number in
                                ZStack(alignment: .bottomTrailing) {
                                    NavigationLink {
                                        ProfileView()
                                    } label: {
                                        Image(systemName: "bell")
                                            .resizable()
                                            .background(Color.red)
                                            .foregroundColor(.white)
                                            .frame(width: 150, height: 200, alignment: .center)
                                            .cornerRadius(20)
                                    }
                                    Button {
                                        print("you pressed \(number)")
                                    } label: {
                                        Image(asset: Asset.Home.plus)
                                            .resizable()
                                            .foregroundColor(.flashSaleIcon)
                                            .frame(width: 15, height: 15)
                                            .padding(10)
                                            .background(Color.iconBackground.opacity(0.8))
                                            .cornerRadius(.infinity)
                                            .padding(10)
                                    }
                                    
                                    
                                }
                                
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 200, idealHeight:  200, maxHeight: 250, alignment: .center)
                        .background(Color.blue)
                        .padding(.top, 200)
                        
                        
                    }
                    

                    .navigationBarTitle("Eyye", displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            VStack(alignment: .center, spacing: 0) {
                                ZStack {
                                    Image(asset: Asset.testProfileImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .clipShape(Circle())
                                        .padding(2)
                                        .background(Color.gray)
                                }
                                .clipShape(Circle())

                                Button {
                                    //
                                } label: {
                                    HStack {
                                        Text(L10n.Home.location)
                                            .font(.montserrat(.regular, size: 12))
                                        Image(asset: Asset.Profile.arrow)
                                            .rotationEffect(Angle.degrees(90))
                                    }
                                    .foregroundColor(.black)
                                }
                            }
//                            .padding(.top, 20)
                            .frame(width: 75, height: 25, alignment: .center)
                            
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                //
                            } label: {
                                Image(asset: Asset.Home.menu)
                                    .foregroundColor(.black)
                            }
                            
                        }
                    }
                }
                
            }
            
            
            
            
            //            .opacity(0.5)
            
        }
    }
}
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
