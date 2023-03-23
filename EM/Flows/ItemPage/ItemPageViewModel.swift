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
    @Published var itemInfo = ItemInfo(name: "Apple MacOS", description: "Shoes inspired by 80s running shoes are still relevant today", rating: 4.2, numberOfReviews: 4000, price: 20, colors: [
        "#ffffff",
        "#b5b5b5",
        "#000000"
      ], imageUrls: [
        "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg",
        "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a94fbe7d8dfb4d3bbaf9ac63000135ed_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_03_standard.jpg",
        "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_05_standard.jpg"
      ])

    private let shopApiService: ShopAPIServicable
    let goToCart: () -> ()

    init(shopApiService: ShopAPIServicable, goToCart: @escaping () -> Void) {
        self.shopApiService = shopApiService
        self.goToCart = goToCart
//        start()
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
