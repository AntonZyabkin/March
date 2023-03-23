//
//  ShowAPIService.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation

protocol ShopAPIServicable {
    func getLatestViewed() async throws -> LatestViewedResponse
    func getFlashSale() async throws -> FlashSaleResponse
    func getWords() async throws -> WordsResponse
    func getItemInfo() async throws -> ItemInfo
}

final class ShopAPIService{
    private let networkService: Networkable

    init(networkService: Networkable) {
        self.networkService = networkService
    }
}

extension ShopAPIService: ShopAPIServicable {
    func getLatestViewed() async throws -> LatestViewedResponse {
        try await networkService.requestAsync(HomeEndpoints.getLatestViewed)
    }
    
    func getFlashSale() async throws -> FlashSaleResponse {
        try await networkService.requestAsync(HomeEndpoints.getFlashSale)
    }
    
    func getWords() async throws -> WordsResponse {
        try await networkService.requestAsync(HomeEndpoints.getWords)
    }
    
    func getItemInfo() async throws -> ItemInfo {
        try await networkService.requestAsync(HomeEndpoints.getItemInfo)
    }
}
