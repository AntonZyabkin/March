//
//  ReusableViews.swift
//  EM
//
//  Created by Anton Zyabkin on 17.03.2023.
//

import Foundation
import SwiftUI
import Kingfisher

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
    let itemPadding: CGFloat = 10
    let spacingItems: CGFloat
    let itemWidth: CGFloat
    
    init(category: [HomeCategory], _ mainHorisontalPadding: CGFloat, _ spacingItems: CGFloat, _ itemWidth: CGFloat) {
        self.category = category
        self.mainHorisontalPadding = mainHorisontalPadding
        self.spacingItems = spacingItems
        self.itemWidth = itemWidth
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: spacingItems) {
                ForEach(category) { category in
                    Button {
                        //
                    } label: {
                        VStack {
                            ImageInCircle(image: category.imageAsset, itemPadding: 12, itemWidth: 20)
                                .padding(.bottom, 5)
                            Text(category.categoruName)
                                .font(.montserrat(.medium, size: 10))
                                .foregroundColor(.mainGray)
                                .foregroundColor(.black)
                        }
                        .lineLimit(1)
                        .frame(maxWidth: itemWidth + spacingItems + itemPadding / 2)
                    }
                }
            }
        }
    }
}

struct LatestScrollView: View {
    let latestItems: [LatestItem]
    let spacingItems: CGFloat
    let itemWidth: CGFloat
    let mainHorizontalPadding: CGFloat
    let itemPadding: CGFloat = 7
    
    init(latestItems: [LatestItem], _ spacingItems: CGFloat, _ itemWidth: CGFloat, _ mainHorizontalPadding: CGFloat) {
        self.latestItems = latestItems
        self.spacingItems = spacingItems
        self.itemWidth = itemWidth
        self.mainHorizontalPadding = mainHorizontalPadding
    }
    
    var body: some View {
        ScrollView([.horizontal], showsIndicators: false) {
            LazyHStack(spacing: spacingItems) {
                ForEach(latestItems) { item in
                    Button {
                        //
                    } label: {
                        ZStack(alignment: .bottom) {
                            CornerRoundedImage(width: itemWidth, imageURL: item.data.imageURL)
                            VStack {
                                HStack(alignment: .bottom) {
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Spacer()
                                        
                                        Text(item.data.category)
                                            .font(.montserrat(.bold, size: 7))
                                            .foregroundColor(.black)
                                            .padding(.vertical, 2)
                                            .padding(.horizontal, 8)
                                            .background(Color.iconBackground).opacity(0.9)
                                            .cornerRadius(6)
                                        Text(item.data.name)
                                            .font(.montserrat(.bold, size: 10))
                                            .foregroundColor(.white)
                                        
                                    }
                                    Spacer()
                                }
                                Spacer()
                                Button {
                                    //
                                } label: {
                                    HStack(alignment: .bottom) {
                                        Text("$ \(String(item.data.price))")
                                            .font(.montserrat(.bold, size: 8))
                                            .foregroundColor(.white)
                                        Spacer()
                                        ImageInCircle(image: Asset.Home.plus, itemPadding: 7, itemWidth: 9)
                                            .foregroundColor(.mainGray)
                                            .opacity(0.8)
                                    }
                                }
                                
                            }
                            .lineLimit(1)
                            .frame(maxWidth: itemWidth - itemPadding * 2)
                            .padding(itemPadding)
                        }
                    }
                }
            }
        }
    }
}

struct FlashSaleScrollView: View {
    let flashSaleItems: [FlashSaleItem]
    let spacingItems: CGFloat
    let mainHorizontalPadding: CGFloat
    let itemWidth: CGFloat
    let itemPadding: CGFloat = 7
    
    init(flashSaleItems: [FlashSaleItem], _ spacingItems: CGFloat, _ mainHorizontalPadding: CGFloat, _ itemWidth: CGFloat) {
        self.flashSaleItems = flashSaleItems
        self.spacingItems = spacingItems
        self.mainHorizontalPadding = mainHorizontalPadding
        self.itemWidth = itemWidth
    }
    var body: some View {
        ScrollView([.horizontal], showsIndicators: false) {
            LazyHStack(spacing: spacingItems) {
                ForEach(flashSaleItems) { item in
                    Button {
                        //
                    } label: {
                        ZStack(alignment: .bottom) {
                            CornerRoundedImage(width: itemWidth, imageURL: item.data.imageURL)
                            VStack(alignment: .trailing) {
                                HStack {
                                    Spacer()
                                    Text("\(String(item.data.discount))% off")
                                        .font(.montserrat(.bold, size: 11))
                                        .frame(width: 55, height: 20, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(Color.saleBackground).opacity(0.8)
                                        .cornerRadius(.infinity)
                                }
                                Spacer()
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
                                        
                                    }
                                    Spacer()
                                }
                                .padding(.bottom, 12)
                                HStack(alignment: .center, spacing: 4) {
                                    Text("$ \(String(item.data.price))")
                                        .font(.montserrat(.bold, size: 14))
                                        .foregroundColor(.white)
                                    Spacer()
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
                            .lineLimit(1)
                            .frame(maxWidth: itemWidth - itemPadding * 2)
                            .padding(itemPadding)
                        }
                    }
                }
            }
        }
    }
}

struct BrandsScrollView: View {
    let latestItem: [LatestItem]
    let spacingItems: CGFloat
    let itemWidth: CGFloat
    let mainHorizontalPadding: CGFloat
    
    init(brandItems: [BrandsItem], _ spacingItems: CGFloat, _ itemWidth: CGFloat, _ mainHorizontalPadding: CGFloat) {
        self.latestItem = brandItems.map{ _ in
            LatestItem(data: Latest(category: "", name: "", price: 0, imageURL: ""))
        }
        self.spacingItems = spacingItems
        self.itemWidth = itemWidth
        self.mainHorizontalPadding = mainHorizontalPadding
    }
    var body: some View {
        LatestScrollView(latestItems: latestItem, spacingItems, itemWidth, mainHorizontalPadding)
    }
}
struct CornerRoundedImage: View {
    let width: CGFloat
    let imageURL: String
    
    var body: some View {
        KFImage(URL(string: imageURL))
            .placeholder{ProgressView()}
            .resizable()
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 1)
            .forceRefresh()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width * 1.3, alignment: .center)
            .background(Color.iconInactiveForeground)
            .cornerRadius(width / 12)
    }
}

struct HeaderItems: View {
    let headerName: String
    let buttonName: String
    let action: () -> Void
    var body: some View {
        HStack() {
            Text(headerName)
                .font(.montserrat(.bold, size: 16))
                .foregroundColor(.black)
            Spacer()
            Button {
                action()
            } label: {
                Text(buttonName)
                    .font(.montserrat(.bold, size: 9))
                    .foregroundColor(.mainGray)
            }
        }
        
    }
}

struct AttentionText: View {
    let message: String
    let isVisible: Bool
    
    var body: some View {
        Text(message)
            .opacity(isVisible ? 1 : 0)
            .font(.montserrat(.light, size: 12))
            .foregroundColor(.red).opacity(0.8)
    }
}
