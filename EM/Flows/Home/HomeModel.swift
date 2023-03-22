//
//  HomeModel.swift
//  EM
//
//  Created by Anton Zyabkin on 17.03.2023.
//

import SwiftUI


struct HomeModel {
    
    static let skelet = HomeModel(
        latestItems:
            [LatestItem(itemImage: Image(asset: Asset.imageCover), data: Latest(category: "", name: "", price: 0, imageURL: "")),
             LatestItem(itemImage: Image(asset: Asset.imageCover), data: Latest(category: "", name: "", price: 0, imageURL: "")),
             LatestItem(itemImage: Image(asset: Asset.imageCover), data: Latest(category: "", name: "", price: 0, imageURL: ""))],
        flashSaleItems: [FlashSaleItem(itemImage: Image(asset: Asset.imageCover), data: FlashSale(category: "", name: "", price: 0, discount: 0, imageURL: "")),
                         FlashSaleItem(itemImage: Image(asset: Asset.imageCover), data: FlashSale(category: "", name: "", price: 0, discount: 0, imageURL: ""))])
    
    let homeCategories =
    [HomeCategory(imageAsset: Asset.Home.phone, categoruName: L10n.Home.phones),
     HomeCategory(imageAsset: Asset.Home.earpods, categoruName: L10n.Home.headphones),
     HomeCategory(imageAsset: Asset.Home.gamePad, categoruName: L10n.Home.games),
     HomeCategory(imageAsset: Asset.Home.car, categoruName: L10n.Home.cars),
     HomeCategory(imageAsset: Asset.Home.bad, categoruName: L10n.Home.furniture),
     HomeCategory(imageAsset: Asset.Home.robot, categoruName: L10n.Home.kids)]
    
    var latestItems: [LatestItem]
    var flashSaleItems: [FlashSaleItem]
    var brandsItems: [BrandsItem]
    
    init(latestItems: [LatestItem], flashSaleItems: [FlashSaleItem], brandsItems: [BrandsItem]) {
        self.latestItems = latestItems
        self.flashSaleItems = flashSaleItems
        self.brandsItems = brandsItems
    }
    init(latestItems: [LatestItem], flashSaleItems: [FlashSaleItem]) {
        self.latestItems = latestItems
        self.flashSaleItems = flashSaleItems
        self.brandsItems =
        [BrandsItem(itemImage: Image(asset: Asset.imageCover)),
         BrandsItem(itemImage: Image(asset: Asset.imageCover)),
         BrandsItem(itemImage: Image(asset: Asset.imageCover))]
    }
}

struct HomeCategory: Identifiable {
    let id = UUID()
    let imageAsset: ImageAsset
    let categoruName: String
}

struct LatestItem: Identifiable {
    let id = UUID()
    let itemImage: Image
    let data: Latest
}

struct FlashSaleItem: Identifiable {
    let id = UUID()
    let itemImage: Image
    let data: FlashSale
}

struct BrandsItem: Identifiable {
    let id = UUID()
    let itemImage: Image
}
