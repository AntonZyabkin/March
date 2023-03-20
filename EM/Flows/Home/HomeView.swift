//
//  HomeView.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = ""
    var viewModel: HomeViewModel
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
                LatestItem(itemImage: Image(asset: Asset.testProfileImage), data: Latest(category: "Phonew", name: "Samsung S10Samsung S10Samsung S10Samsung S10", price: 180, imageURL: "")),
                LatestItem(itemImage: Image(asset: Asset.testProfileImage), data: Latest(category: "Phonew", name: "Samsung S10", price: 180, imageURL: "")),
                LatestItem(itemImage: Image(asset: Asset.testProfileImage), data: Latest(category: "Phonew", name: "Samsung S10", price: 180, imageURL: ""))
            ],
        flashSaleItems:
            [
                FlashSaleItem(itemImage: Image(asset: Asset.testProfileImage), data: FlashSale(category: "Kids", name: "New balance", price: 33, discount: 30, imageURL: "")),
                FlashSaleItem(itemImage: Image(asset: Asset.testProfileImage), data: FlashSale(category: "Kids", name: "Kids", price: 33, discount: 30, imageURL: "")),
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
            GeometryReader { geometry in
                NavigationView {
                    VStack {
                        ZStack(alignment: .trailing) {
                            TextField(L10n.Home.searchPlaceholder, text: $searchText)
                                .font(.montserrat(.light, size: 10))
                                .multilineTextAlignment(.center)
                                .padding(4)
                                .background(Color.searchFieldBackground)
                                .foregroundColor(.black)
                                .cornerRadius(.infinity)
                            Image(asset: Asset.Home.search)
                                .resizable()
                                .foregroundColor(Color.mainGray)
                                .frame(width: 10, height: 10)
                                .aspectRatio(contentMode: .fit)
                                .padding(.trailing, 10)
                        }
                        .padding(.horizontal, 70)
                        .padding(.bottom, 15)
                        CategoryScrollView(category: homeModel.homeCategories, mainHorizontalPadding, spacingSixItems, sixItemWidth(geometry: geometry))
                            .frame(height: sixItemWidth(geometry: geometry) * 1.38)
                            .padding(.horizontal, mainHorizontalPadding)
                            .padding(.bottom, 23)
                        
                        ScrollView([.vertical], showsIndicators: true) {
                            HeaderItems(headerName: L10n.Home.latest, buttonName: L10n.Home.viewAll) {
                                //some action
                            }
                            .padding(.horizontal, mainHorizontalPadding)
                            .padding(.bottom, -4)
                            
                            LatestScrollView(latestItems: homeModel.latestItems, spacingThreeItems, threeItemWidth(geometry: geometry), mainHorizontalPadding)
                                .padding(.leading, mainHorizontalPadding)
                                .frame(height: threeItemWidth(geometry: geometry) * 1.3)
                                .padding(.bottom, 12)
                            
                            HeaderItems(headerName: L10n.Home.flashSale, buttonName: L10n.Home.viewAll) {
                                //some action
                            }
                            .padding(.horizontal, mainHorizontalPadding)
                            .padding(.bottom, -4)
                            FlashSaleScrollView(flashSaleItems: homeModel.flashSaleItems, spacingTwoItems, mainHorizontalPadding, twoItemWidth(geometry: geometry))
                                .padding(.leading, mainHorizontalPadding)
                                .frame(height: twoItemWidth(geometry: geometry) * 1.3)
                                .padding(.bottom, 12)
                            
                            HeaderItems(headerName: L10n.Home.brands, buttonName: L10n.Home.viewAll) {
                                //some action
                            }
                            .padding(.horizontal, mainHorizontalPadding)
                            .padding(.bottom, -4)
                            
                            BrandsScrollView(brandItems: homeModel.brandsItems, spacingThreeItems, threeItemWidth(geometry: geometry), mainHorizontalPadding)
                                .padding(.leading, mainHorizontalPadding)
                                .frame(height: threeItemWidth(geometry: geometry) * 1.3)
                                .padding(.bottom, 70)
                        }
                        .clipped()
                    }
                    .padding(.top, 30)
                    
                    
                    
                    //MARK: - Custom TabBarItems
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                //
                            } label: {
                                VStack(alignment: .center) {
                                    Image(asset: Asset.testProfileImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 35, height: 35, alignment: .center)
                                        .clipShape(Circle())
                                        .padding(2)
                                        .background(Color.gray)
                                        .clipShape(Circle())
                                    HStack {
                                        Text(L10n.Home.location)
                                        Image(asset: Asset.Profile.arrow)
                                            .rotationEffect(Angle.degrees(90))
                                    }
                                    .font(.montserrat(.regular, size: 10))
                                    .foregroundColor(.black)
                                }
                            }
                            .padding(.trailing, 30)
                            .padding(.top, 30)
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
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem {
                            HStack(alignment: .center) {
                                Text("Trade by")
                                    .foregroundColor(.black)
                                Text("bate")
                                    .foregroundColor(.buttonBackground)
                            }
                            .font(.montserrat(.bold, size: 22))
                            .padding(.trailing, 40)
                        }
                    }
                }
            }
        }
        //        .opacity(0.4)
    }
    func twoItemWidth(geometry: GeometryProxy) -> CGFloat {
        (geometry.size.width - 2 * mainHorizontalPadding - spacingTwoItems) / 2
    }
    func threeItemWidth(geometry: GeometryProxy) -> CGFloat {
        (geometry.size.width - 2 * spacingThreeItems - mainHorizontalPadding) / 3
    }
    func sixItemWidth(geometry: GeometryProxy) -> CGFloat {
        (geometry.size.width - 2 * mainHorizontalPadding - 5 * spacingSixItems) / 6
    }
}
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(shopApiService: ShopAPIService(networkService: NetworkService(decoderService: DecoderService()))))
    }
}

private let mainHorizontalPadding: CGFloat = 11
private let spacingSixItems: CGFloat = 17
private let spacingThreeItems: CGFloat = 13
private let spacingTwoItems: CGFloat = 12

