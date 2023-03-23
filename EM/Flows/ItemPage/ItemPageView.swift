//
//  ItemPageView.swift
//  EM
//
//  Created by Anton Zyabkin on 23.03.2023.
//

import SwiftUI

struct ItemPageView: View {
    @ObservedObject var viewModel: ItemPageViewModel
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ZStack  {
                    Image("5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.5)
                }
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        TabView {
                            Image("testProfileImage")
                                .resizable()
                                .scaledToFit()
                        }
                        .tabViewStyle(.page)
                        .frame(width: geometry.size.width - 45, height: (geometry.size.width - 50) * 0.85, alignment: .leading)
                        .background(Color.red)
                        .cornerRadius(15)
                        .offset(x: -10)
                        .padding(.top, 30)
                        
                        ZStack {
                            VStack {
                                Button {
                                    //
                                } label: {
                                    Image(asset: Asset.ItemPage.heartItemPage)
                                }
                                .padding(10)
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 15, height: 2)
                                Button {
                                    //
                                } label: {
                                    Image(asset: Asset.ItemPage.shareItemPage)
                                }
                                .padding(10)
                            }
                            .frame(width: 50, height: 110)
                            .background(Color.searchFieldBackground)
                            .cornerRadius(15)
                        }
                        .padding(.trailing, 10)
                        .padding(.bottom, 25)
                    }
                    .frame(width: geometry.size.width)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                    }
                    .frame(width: geometry.size.width, height: 55)
                    .background(Color.green)
                    .padding(.top, 27)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(alignment: .top) {
                            Text(viewModel.itemInfo.name)
                            Spacer()
                            Text("$\(Double(viewModel.itemInfo.price), specifier: "%.2f")")
                        }
                        Text(viewModel.itemInfo.description)
                        HStack {
                            Image(asset: Asset.ItemPage.starItemPage)
                            Text(String(viewModel.itemInfo.rating))
                            Text("(\(String(viewModel.itemInfo.numberOfReviews)) \(L10n.Item.reviews))")
                        }
                        Text(L10n.Item.color)
                        HStack{
                            ForEach(viewModel.itemInfo.colors, id: \.self) { color in
                                //
                            }
                        }
                    }
                    .padding(25)
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.blueBackground)
                        HStack {
                            VStack {
                                Text(L10n.Item.quantity)
                                HStack {
                                    Button {
                                        //
                                    } label: {
                                        Text("-")
                                    }
                                    Spacer()
                                    Button {
                                        //
                                    } label: {
                                        Text("+")
                                    }

                                }
                            }
                            Spacer()
                            Button {
                                //
                            } label: {
                                HStack {
                                    Text("#2500")
                                        Spacer()
                                    Text(L10n.Item.addToCard)
                                }
                            }

                        }
                    }

                }
            }
            .opacity(0.5)
        }
    }
}

struct ItemPageView_Previews: PreviewProvider {
    static var previews: some View {
        ItemPageView(viewModel: ItemPageViewModel(shopApiService: ShopAPIService(networkService: NetworkService(decoderService: DecoderService())), goToCart: {}))
    }
}
