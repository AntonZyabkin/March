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
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        TabView {
                            ForEach(viewModel.itemInfo.imageUrls, id: \.self) { imageUrl in
                                CornerRoundedImage(width: geometry.size.width, imageURL: imageUrl)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(width: geometry.size.width - 45, height: (geometry.size.width - 50) * 0.85, alignment: .leading)
                        .cornerRadius(10)
                        .padding(.trailing, 52)
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
                            .frame(width: 45, height: 105)
                            .background(Color.searchFieldBackground)
                            .cornerRadius(15)
                        }
                        .padding(.trailing, 30)
                        .padding(.bottom, 35)
                    }
                    .padding(.top, 30)
                    .offset(x: -10)
                    .frame(width: geometry.size.width)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                    }
                    .frame(width: geometry.size.width, height: 55)
                    .background(Color.clear)
                    .padding(.top, 27)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .center) {
                            Text(viewModel.itemInfo.name)
                                .font(.montserrat(.bold, size: 20))
                            Spacer()
                            Text("$\(Double(viewModel.itemInfo.price), specifier: "%.2f")")
                                .font(.montserrat(.bold, size: 14))
                        }
                        Text(viewModel.itemInfo.description)
                            .font(.montserrat(.regular, size: 10))
                            .foregroundColor(.iconInactiveForeground)
                            .padding(.top, 40)
                            .lineLimit(2)
                        HStack(spacing:0) {
                            Image(asset: Asset.ItemPage.starItemPage)
                            Text(String(viewModel.itemInfo.rating))
                                .font(.montserrat(.bold, size: 10))
                            Text("(\(String(viewModel.itemInfo.numberOfReviews)) \(L10n.Item.reviews))")
                                .font(.montserrat(.regular, size: 10))
                                .foregroundColor(.iconInactiveForeground)
                        }
                        .padding(.top, 15)
                        Text(L10n.Item.color)
                            .padding(.top, 14)
                            .font(.montserrat(.regular, size: 12))
                            .foregroundColor(.iconInactiveForeground)
                        
                        HStack(spacing: 11){
                            ForEach(viewModel.itemInfo.colors, id: \.self) { color in
                                Button {
                                    viewModel.colorIsSelected = color
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 38, height: 28, alignment: .center)
                                        .foregroundColor(Color.init(hex: color))
                                        .padding(2)
                                        .background( color == viewModel.colorIsSelected ? Color.gray : Color.clear)
                                        .cornerRadius(12)
                                }
                                
                            }
                        }
                        .padding(.top, 10)
                        Spacer()
                    }
                    .padding(.top, 12)
                    .padding(.horizontal, 25)
                    Spacer()
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.blueBackground)
                        HStack {
                            VStack(alignment: .leading, spacing: 11) {
                                Text(L10n.Item.quantity)
                                    .font(.montserrat(.bold, size: 10))
                                HStack(spacing: 22) {
                                    Button {
                                        if viewModel.numberOfItems > 0 {
                                            viewModel.numberOfItems -= 1
                                        }
                                    } label: {
                                        Text("-")
                                            .frame(width: 43, height: 25)
                                            .font(.montserrat(.bold, size: 25))
                                            .background(Color.buttonBackground)
                                            .cornerRadius(10)
                                    }
                                    Button {
                                        viewModel.numberOfItems += 1
                                    } label: {
                                        Text("+")
                                            .frame(width: 43, height: 25)
                                            .font(.montserrat(.bold, size: 25))
                                            .background(Color.buttonBackground)
                                            .cornerRadius(10)
                                    }
                                    Spacer()
                                }
                            }
                            .padding(.top, 6)
                            .padding(.leading, 16)
                            Spacer()
                            Button {
                                viewModel.goToCart()
                            } label: {
                                HStack {
                                    Text("$\(viewModel.numberOfItems * viewModel.itemInfo.price)")
                                        .frame(width: 80)
                                    Text(L10n.Item.addToCard)
                                        .lineLimit(1)
                                    Spacer()
                                }
                                .font(.montserrat(.bold, size: 8))
                                .frame(width: 188, height: 50)
                                .background(Color.buttonBackground)
                                .cornerRadius(20)
                            }
                            .padding(.trailing, 16)
                            .padding(.top, 10)


                        }
                        .padding(10)
                    }
                    .foregroundColor(.white)
                    .frame(height: 190)

                }
                .padding(.top, 50)
            }
            .background(Color.pageBackground).ignoresSafeArea()
        }
    }
}

struct ItemPageView_Previews: PreviewProvider {
    static var previews: some View {
        ItemPageView(viewModel: ItemPageViewModel(shopApiService: ShopAPIService(networkService: NetworkService(decoderService: DecoderService())), goToCart: {}))
    }
}


