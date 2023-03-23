//
//  HomeView.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
                NavigationView {
                    VStack {
                        ZStack(alignment: .trailing) {
                            TextField(L10n.Home.searchPlaceholder, text: $viewModel.searchTextField)
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
                        
                        CategoryScrollView(category: viewModel.homeModel.homeCategories, mainHorizontalPadding, spacingSixItems, sixItemWidth(geometry: geometry))
                            .frame(height: sixItemWidth(geometry: geometry) * 1.38)
                            .padding(.horizontal, mainHorizontalPadding)
                            .padding(.top, 15)
                        
                        ScrollView([.vertical], showsIndicators: true) {
                            HeaderItems(headerName: L10n.Home.latest, buttonName: L10n.Home.viewAll) {
                                //some action
                            }
                            .padding(.horizontal, mainHorizontalPadding)
                            .padding(.top, 23)
                            
                            LatestScrollView(latestItems: viewModel.homeModel.latestItems, spacingThreeItems, threeItemWidth(geometry: geometry), mainHorizontalPadding)
                                .padding(.leading, mainHorizontalPadding)
                                .frame(height: threeItemWidth(geometry: geometry) * 1.3)
                                .padding(.top, -8)
                                .padding(.bottom, 12)
                            
                            HeaderItems(headerName: L10n.Home.flashSale, buttonName: L10n.Home.viewAll) {
                                //some action
                            }
                            .padding(.horizontal, mainHorizontalPadding)
                            .padding(.bottom, -4)
                            FlashSaleScrollView(flashSaleItems: viewModel.homeModel.flashSaleItems, spacingTwoItems, mainHorizontalPadding, twoItemWidth(geometry: geometry), showItemPage: viewModel.showItemPage)
                                .padding(.leading, mainHorizontalPadding)
                                .frame(height: twoItemWidth(geometry: geometry) * 1.3)
                                .padding(.bottom, 12)
                            
                            HeaderItems(headerName: L10n.Home.brands, buttonName: L10n.Home.viewAll) {
                                //some action
                            }
                            .padding(.horizontal, mainHorizontalPadding)
                            .padding(.bottom, -4)
                            
                            BrandsScrollView(brandItems: viewModel.homeModel.brandsItems, spacingThreeItems, threeItemWidth(geometry: geometry), mainHorizontalPadding)
                                .padding(.leading, mainHorizontalPadding)
                                .frame(height: threeItemWidth(geometry: geometry) * 1.3)
                                .padding(.bottom, 70)
                        }
                        .clipped()
                    }
                    .padding(.top, 30)
                    .background(Color.pageBackground.ignoresSafeArea())
                    
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
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("Load data error"), message: nil, dismissButton: .default(Text("Ok")) {
                    viewModel.showingAlert.toggle()
                })
            }
            VStack {
                ForEach(viewModel.predictedValue, id: \.self) { request in
                    Button {
                        viewModel.itemDidSelect(request)
                    } label: {
                        VStack {
                            Text(request)
                                .padding(.vertical, 2)
                                .font(.montserrat(.light, size: 10))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                        }
                    }

                }
            }
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 70)
            .padding(.top, 140)
        }
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
        HomeView(viewModel: HomeViewModel(shopApiService: ShopAPIService(networkService: NetworkService(decoderService: DecoderService())), showItemPage: {item in }))
    }
}

private let mainHorizontalPadding: CGFloat = 11
private let spacingSixItems: CGFloat = 17
private let spacingThreeItems: CGFloat = 13
private let spacingTwoItems: CGFloat = 12

