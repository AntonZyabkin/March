//
//  RecentlyViewedResponce.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation

// MARK: - LatestViewedResponce
struct LatestViewedResponce: Codable {
    let latest: [Latest]
}

// MARK: - Latest
struct Latest: Codable {
    let category, name: String
    let price: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
