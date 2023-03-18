//
//  HomeModel.swift
//  EM
//
//  Created by Anton Zyabkin on 17.03.2023.
//

import SwiftUI


struct HomeModel {
    let homeCategories: [HomeCategory]
    let latestItems: [LatestItem]
    let flashSaleItems: [FlashSaleItem]
    let brandsItems: [BrandsItem]
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
