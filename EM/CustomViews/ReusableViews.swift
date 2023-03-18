//
//  ReusableViews.swift
//  EM
//
//  Created by Anton Zyabkin on 17.03.2023.
//

import Foundation
import SwiftUI
struct ImageInCircle: View {
    let image: ImageAsset
    let itemPadding: CGFloat
    let itemWidth: CGFloat
    
    var body: some View {
        Image(asset: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: itemWidth, height: itemWidth, alignment: .center)
            .padding(itemPadding)
            .foregroundColor(.black)
            .background(Color.iconBackground)
            .cornerRadius(.infinity)
    }
}

struct CategoryScrollView: View {
    let category: [HomeCategory]
    let mainHorisontalPadding: CGFloat
    let itemWidth: CGFloat = 20
    let itemPadding: CGFloat = 12
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: itemSpace(geometry: geometry)) {
                    ForEach(category) { category in
                        VStack {
                            ImageInCircle(image: category.imageAsset, itemPadding: itemPadding, itemWidth: itemWidth)
                            Text(category.categoruName)
                                .font(.montserrat(.medium, size: 10))
                                .foregroundColor(.mainGray)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.leading, 5)
            }
            
        }
    }
    func itemSpace(geometry: GeometryProxy) -> CGFloat {
        (geometry.size.width - mainHorisontalPadding * 2 - (itemWidth + 2 * itemPadding) * 6 - 10) / 5
    }
}

struct LatestScrollView: View {
    let latestItems: [LatestItem]
    let spacingItems: CGFloat
    let geometry: GeometryProxy
    let mainHorizontalPadding: CGFloat
    init(latestItems: [LatestItem], _ spacingItems: CGFloat, _ geometry: GeometryProxy, _ mainHorizontalPadding: CGFloat) {
        self.latestItems = latestItems
        self.spacingItems = spacingItems
        self.geometry = geometry
        self.mainHorizontalPadding = mainHorizontalPadding
    }
    
    var body: some View {
        ScrollView([.horizontal], showsIndicators: false) {
            HStack(spacing: spacingItems) {
                ForEach(latestItems) { item in
                    Button {
                        //
                    } label: {
                        ZStack(alignment: .bottom) {
                            CornerRoundedImage(width: itemWidth(geometry: geometry), image: item.itemImage)
                            HStack(alignment: .bottom) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.data.category)
                                        .font(.montserrat(.bold, size: 7))
                                        .padding(3)
                                        .foregroundColor(.black)
                                        .background(Color.iconBackground).opacity(0.8)
                                        .cornerRadius(6)
                                    Text(item.data.name)
                                        .font(.montserrat(.bold, size: 10))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    Text("$ \(String(item.data.price))")
                                        .font(.montserrat(.bold, size: 8))
                                        .foregroundColor(.white)
                                }
                                .frame(height: 55)
                                .padding(.bottom, 4)
                                .padding(.leading,3)
                                Spacer()
                                Button {
                                    //
                                } label: {
                                    ImageInCircle(image: Asset.Home.plus, itemPadding: 7, itemWidth: 9)
                                        .foregroundColor(.mainGray)
                                        .opacity(0.8)
                                }
                                
                            }
                            .padding(.horizontal, 5)
                            .padding(.bottom, 6)
                        }
                        
                    }
                    
                }
            }
        }
    }
    
    func itemWidth(geometry: GeometryProxy) -> CGFloat {
        (geometry.size.width - 2 * spacingItems - mainHorizontalPadding) / 3
    }
}

struct FlashSaleScrollView: View {
    let flashSaleItems: [FlashSaleItem]
    let spacingItems: CGFloat
    let mainHorizontalPadding: CGFloat
    
    init(flashSaleItems: [FlashSaleItem], _ spacingItems: CGFloat, _ mainHorizontalPadding: CGFloat) {
        self.flashSaleItems = flashSaleItems
        self.spacingItems = spacingItems
        self.mainHorizontalPadding = mainHorizontalPadding
    }
    var body: some View {
        GeometryReader { geometry in
            ScrollView([.horizontal], showsIndicators: false) {
                HStack(spacing: spacingItems) {
                    ForEach(flashSaleItems) { item in
                        Button {
                            //
                        } label: {
                            ZStack(alignment: .bottom) {
                                CornerRoundedImage(width: itemWidth(geometry: geometry), image: item.itemImage)
                                VStack(alignment: .trailing) {
                                    Text("\(String(item.data.discount))% off")
                                        .font(.montserrat(.bold, size: 11))
                                        .frame(width: 55, height: 20, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(Color.saleBackground).opacity(0.8)
                                        .cornerRadius(.infinity)
                                        .padding(.bottom, 90)
                                        .padding(.trailing, 6)
                                    
                                    HStack(alignment: .bottom) {
                                        VStack(alignment: .leading, spacing: 9) {
                                            Text(item.data.category)
                                                .font(.montserrat(.bold, size: 10))
                                                .frame(width: 55, height: 20, alignment: .center)
                                                .foregroundColor(.black)
                                                .background(Color.iconBackground).opacity(0.8)
                                                .cornerRadius(.infinity)
                                            Text(item.data.name)
                                                .font(.montserrat(.bold, size: 13.5))
                                                .foregroundColor(.white)
                                                .padding(.bottom, 24)
                                            
                                            Text("$ \(String(item.data.price))")
                                                .font(.montserrat(.bold, size: 12))
                                                .foregroundColor(.white)
                                        }
                                        .padding(.leading, 10)
                                        .frame(height: 110)
                                        Spacer()
                                        HStack(spacing:4) {
                                            Button {
                                                //
                                            } label: {
                                                ImageInCircle(image: Asset.Home.heart, itemPadding: 7, itemWidth: 18)
                                                    .foregroundColor(.mainGray)
                                                    .opacity(0.8)
                                            }
                                            Button {
                                                //
                                            } label: {
                                                ImageInCircle(image: Asset.Home.plus, itemPadding: 10, itemWidth: 18)
                                                    .foregroundColor(.mainGray)
                                                    .opacity(0.8)
                                            }
                                            
                                        }
                                        
                                    }
                                    .padding(.trailing, 4)
                                    .padding(.bottom, 12)
                                }
                            }
                            
                        }
                        
                    }
                }
            }
        }
    }
    
    func itemWidth(geometry: GeometryProxy) -> CGFloat {
        (geometry.size.width - 2 * mainHorizontalPadding - spacingItems) / 2
    }
}

struct BrandsScrollView: View {
    let latestItem: [LatestItem]
    let spacingItems: CGFloat
    let geometry: GeometryProxy
    let mainHorizontalPadding: CGFloat
    
    init(brandItems: [BrandsItem], _ spacingItems: CGFloat, _ geometry: GeometryProxy, _ mainHorizontalPadding: CGFloat) {
        self.latestItem = brandItems.map{
            LatestItem(itemImage: $0.itemImage, data: Latest(category: "", name: "", price: 0, imageURL: ""))
        }
        self.spacingItems = spacingItems
        self.geometry = geometry
        self.mainHorizontalPadding = mainHorizontalPadding
    }
    var body: some View {
        LatestScrollView(latestItems: latestItem, spacingItems, geometry, mainHorizontalPadding)
    }
}
struct CornerRoundedImage: View {
    let width: CGFloat
    let image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width * 1.3, alignment: .center)
            .cornerRadius(width / 12)
    }
}

struct HeaderItems: View {
    let headerName: String
    let buttonName: String
    let action: () -> Void
    var body: some View {
        HStack {
            Text(headerName)
                .font(.montserrat(.bold, size: 16))
                .foregroundColor(.black)
            Spacer()
            Button {
                action()
            } label: {
                Text(buttonName)
                    .font(.montserrat(.bold, size: 12))
                    .foregroundColor(.mainGray)
            }
        }
        
    }
}
