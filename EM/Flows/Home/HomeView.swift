//
//  HomeView.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    
    var viewModel: HomeViewModelProtocol?
    var homeModel = HomeModel(
        homeCategories:
            [
                HomeCategory(imageAsset: Asset.Home.phone, categoruName: L10n.Home.phones),
                HomeCategory(imageAsset: Asset.Home.earpods, categoruName: L10n.Home.headphones),
                HomeCategory(imageAsset: Asset.Home.gamePad, categoruName: L10n.Home.games),
                HomeCategory(imageAsset: Asset.Home.car, categoruName: L10n.Home.cars),
                HomeCategory(imageAsset: Asset.Home.bad, categoruName: L10n.Home.furniture),
                HomeCategory(imageAsset: Asset.Home.robot, categoruName: L10n.Home.kids),
            ],
        latestItems:
            [
                LatestItem(itemImage: Image(asset: Asset.testProfileImage), data: Latest(category: "Phonew", name: "Samsung S10", price: 180, imageURL: "")),
                LatestItem(itemImage: Image(asset: Asset.testProfileImage), data: Latest(category: "Phonew", name: "Samsung S10", price: 180, imageURL: "")),
                LatestItem(itemImage: Image(asset: Asset.testProfileImage), data: Latest(category: "Phonew", name: "Samsung S10", price: 180, imageURL: ""))
            ],
        flashSaleItems:
            [
                FlashSaleItem(itemImage: Image(asset: Asset.testProfileImage), data: FlashSale(category: "Kids", name: "New balance", price: 33, discount: 30, imageURL: "")),
                FlashSaleItem(itemImage: Image(asset: Asset.testProfileImage), data: FlashSale(category: "Kids", name: "New balance", price: 33, discount: 30, imageURL: "")),
                FlashSaleItem(itemImage: Image(asset: Asset.testProfileImage), data: FlashSale(category: "Kids", name: "New balance", price: 33, discount: 30, imageURL: ""))
            ],
        brandsItems:
            [
                BrandsItem(itemImage: Image(asset: Asset.testProfileImage)),
                BrandsItem(itemImage: Image(asset: Asset.testProfileImage)),
                BrandsItem(itemImage: Image(asset: Asset.testProfileImage)),
                
            ]
    )
    var body: some View {
        ZStack(alignment: .top) {
            Color.pageBackground
                .ignoresSafeArea()
            GeometryReader { geometry in
                ZStack  {
                    Image("4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0)
                }
            }
            
            //            NavigationView {
            GeometryReader { geometry in
                VStack {
                    CategoryScrollView(category: homeModel.homeCategories, mainHorisontalPadding: mainHorizontalPadding)
                        .frame(height: 65)
                        .padding(.horizontal, mainHorizontalPadding)
                    ScrollView([.vertical], showsIndicators: true) {
                        HeaderItems(headerName: L10n.Home.latest, buttonName: L10n.Home.viewAll) {
                            //some action
                        }
                        .padding(.horizontal, mainHorizontalPadding)
                        .padding(.bottom, 43)
                        
                        LatestScrollView(latestItems: homeModel.latestItems, spacingThreeItems, geometry, mainHorizontalPadding)
                            .padding(.leading, mainHorizontalPadding)
                            .frame(height: threeItemWidth(geometry: geometry) * 1.3)

                        HeaderItems(headerName: L10n.Home.flashSale, buttonName: L10n.Home.viewAll) {
                            //some action
                        }
                        .padding(.horizontal, mainHorizontalPadding)
                        
                        FlashSaleScrollView(flashSaleItems: homeModel.flashSaleItems, spacingTwoItems, mainHorizontalPadding)
                            .padding(.leading, mainHorizontalPadding)
                            .frame(height: twoItemWidth(geometry: geometry) * 1.3)
                        
                        HeaderItems(headerName: L10n.Home.brands, buttonName: L10n.Home.viewAll) {
                            //some action
                        }
                        .padding(.leading, mainHorizontalPadding)
                        
                        BrandsScrollView(brandItems: homeModel.brandsItems, spacingThreeItems, geometry, mainHorizontalPadding)
                            .padding(.leading, mainHorizontalPadding)
                            .frame(height: threeItemWidth(geometry: geometry) * 1.3)
                    }
                    .clipped()
                }
                .padding(.top, 100)
                
                .navigationBarTitle("Eyye", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        VStack(alignment: .center, spacing: 0) {
                            Image(asset: Asset.testProfileImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40, alignment: .center)
                                .clipShape(Circle())
                                .padding(2)
                                .background(Color.gray)
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
                        .frame(width: 75, height: 25, alignment: .center)
                        
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            //
                        } label: {
                            Image(asset: Asset.Home.menu)
                                .resizable()
                                .foregroundColor(.black)
                        }
                        
                    }
                }
            }
        }
        //        }
        //                .opacity(0.4)
    }
    func twoItemWidth(geometry: GeometryProxy) -> CGFloat {
        (geometry.size.width - 2 * spacingTwoItems) / 2
    }
    func threeItemWidth(geometry: GeometryProxy) -> CGFloat {
        (geometry.size.width - 2 * spacingThreeItems) / 3
    }
}
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

private let mainHorizontalPadding: CGFloat = 12
private let spacingThreeItems: CGFloat = 13
private let spacingTwoItems: CGFloat = 10

