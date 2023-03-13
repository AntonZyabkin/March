//
//  HomeViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    func getlatest()
}

final class HomeViewModel: ObservableObject {
    private let shopApiService: ShopAPIServicable
    private let coordinator: AppCoordinator
    
    
    init(shopApiService: ShopAPIServicable, coordinator: AppCoordinator) {
        self.shopApiService = shopApiService
        self.coordinator = coordinator
        getlatest()
    }
    
    
    private func showError(_ error: Error) async {
        await MainActor.run {
            print(error)
        }
    }
}


extension HomeViewModel: HomeViewModelProtocol {
    func getlatest() {
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
