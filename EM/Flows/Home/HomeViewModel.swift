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
}

final class HomeViewModel: ObservableObject {
    private let shopApiService: ShopAPIServicable
    private let coordinator: AppCoordinator
    
    @Published var image = Image(systemName: "bell")
    
    
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
                switch error {
                case .selfError:
                    await showError(error)
                case .responseError:
                    await showError(error)
                case .unknownError:
                    await showError(error)
                case .decodeError(let decodeError):
                    await showError(decodeError)
                }
            }
        }
    }
}


extension Image {
    /// Initializes a SwiftUI `Image` from data.
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
