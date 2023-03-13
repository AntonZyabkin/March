//
//  ShowAPIService.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation

protocol ShopAPIServicable {
    func getLatestViewed() async throws -> LatestViewedResponce
    func getFlashSale() async throws -> FlashSaleResponce
}

final class ShopAPIService{
    private let networkService: Networkable

    init(networkService: Networkable) {
        self.networkService = networkService
    }
}

extension ShopAPIService: ShopAPIServicable {
    func getLatestViewed() async throws -> LatestViewedResponce {
        try await networkService.requestAsync(ShopEndpoints.getLatestViewed)
    }
    
    func getFlashSale() async throws -> FlashSaleResponce {
        try await networkService.requestAsync(ShopEndpoints.getFlashSale)
    }
}
