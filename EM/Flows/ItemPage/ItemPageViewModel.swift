//
//  ItemPageViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 23.03.2023.
//

import Foundation
//
//  HomeViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Combine
import SwiftUI


@MainActor
final class ItemPageViewModel: ObservableObject {
    
    @Published var showingAlert = false
    @Published var itemInfo = ItemInfo(name: "", description: "", rating: 0, numberOfReviews: 0, price: 0, colors: [], imageUrls: [])
    @Published var colorIsSelected = ""
    @Published var numberOfItems: Int = 0

    private let shopApiService: ShopAPIServicable
    let goToCart: () -> ()

    init(shopApiService: ShopAPIServicable, goToCart: @escaping () -> Void) {
        self.shopApiService = shopApiService
        self.goToCart = goToCart
        start()
    }

    private func showError(_ error: Error) async {
        await MainActor.run {
            print(error)
            showingAlert.toggle()
        }
    }
    
    func start() {
        Task(priority: .userInitiated) {
            do {
                let itemInfo = try await shopApiService.getItemInfo()
                await MainActor.run {
                    self.itemInfo = itemInfo
                }
            } catch let error as NetworkError {
                await showError(error)
            }
        }
    }
}
