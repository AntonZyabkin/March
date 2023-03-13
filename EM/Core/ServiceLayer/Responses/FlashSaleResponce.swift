//
//  FlashSaleResponce.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation

// MARK: - FlashSaleResponce
struct FlashSaleResponce: Codable {
    let flashSale: [FlashSale]

    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

// MARK: - FlashSale
struct FlashSale: Codable {
    let category, name: String
    let price: Double
    let discount: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}
