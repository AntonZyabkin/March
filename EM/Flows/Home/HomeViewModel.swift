//
//  HomeViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation
import SwiftUI

protocol HomeViewModelProtocol {
    func getlatest()
    var image: Image { get set }
    var homeModel: HomeModel { get set }
}

final class HomeViewModel: ObservableObject {
    private let shopApiService: ShopAPIServicable
    private let coordinator: AppCoordinator
    
    @Published var image = Image(systemName: "bell")
    @Published var homeModel = HomeModel(
        homeCategories:
            [
                HomeCategory(imageAsset: Asset.Home.phone, categoruName: L10n.Home.phones),
                HomeCategory(imageAsset: Asset.Home.earpods, categoruName: L10n.Home.headphones),
                HomeCategory(imageAsset: Asset.Home.gamePad, categoruName: L10n.Home.games),
                HomeCategory(imageAsset: Asset.Home.car, categoruName: L10n.Home.cars),
                HomeCategory(imageAsset: Asset.Home.bad, categoruName: L10n.Home.furniture),
                HomeCategory(imageAsset: Asset.Home.robot, categoruName: L10n.Home.kids),
            ], latestItems: [], flashSaleItems: [], brandsItems: []
    )
    
    init(shopApiService: ShopAPIServicable, coordinator: AppCoordinator) {
        self.shopApiService = shopApiService
        self.coordinator = coordinator
    }
    
    
    private func showError(_ error: Error) async {
        await MainActor.run {
            print(error)
        }
    }
}


extension HomeViewModel: HomeViewModelProtocol {
    func fetchPhoto() {
        guard let url = URL(string: "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
              let data = try? Data(contentsOf: url),
              let image = Image(data: data)
        else { return }
        self.image = image
    }
    func getlatest() {
        print("getlatest")
        Task(priority: .utility) {
            do {
                let flashSale = try await shopApiService.getFlashSale()
//                let latestViewed = try await shopApiService.getLatestViewed()
                
                await MainActor.run {
                    print(flashSale)
//                    print(latestViewed)
                }
            } catch let error as NetworkError {
                    await showError(error)
            }
        }
    }
}


extension Image {
    init?(data: Data) {
        #if canImport(UIKit)
        if let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            return nil
        }
        #elseif canImport(AppKit)
        if let nsImage = NSImage(data: data) {
            self.init(nsImage: nsImage)
        } else {
            return nil
        }
        #else
        return nil
        #endif
    }
}
