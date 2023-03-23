//
//  HomeViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Combine
import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var searchTextField: String = ""
    @Published var homeModel = HomeModel.skelet
    @Published var showingAlert = false
    @Published var predictedValue: [String] = ["Hello, world!", "Test1", "Buubs"]
    private let shopApiService: ShopAPIServicable
    private var disposeBag = Set<AnyCancellable>()
    let showItemPage: () -> Void

    init(shopApiService: ShopAPIServicable, showItemPage: @escaping () -> Void) {
        self.shopApiService = shopApiService
        self.showItemPage = showItemPage
        searchWords()
        start()
    }

    private func showError(_ error: Error) async {
        await MainActor.run {
            print(error)
            showingAlert.toggle()
        }
    }
    
     func itemDidSelect(_ request: String) {
        searchTextField = request
        predictedValue = []
    }

    
    func start() {
        Task(priority: .userInitiated) {
            do {
                let flashSale = try await shopApiService.getFlashSale()
                let latestViewed = try await shopApiService.getLatestViewed()
                
                let flashSaleItems = flashSale.flashSale.map { FlashSaleItem(data: $0) }
                let latestItems = latestViewed.latest.map { LatestItem(data: $0) }
                
                await MainActor.run {
                    homeModel = HomeModel(latestItems: latestItems, flashSaleItems: flashSaleItems)
                }
            } catch let error as NetworkError {
                await showError(error)
            }
        }
    }
    
    func searchWords() {
        $searchTextField
            .debounce(for: 1, scheduler: RunLoop.current)
            .sink { [weak self]  _ in
                guard let self = self else { return }
                Task {
                    do {
                        let words = try await self.shopApiService.getWords()
                        let contains = words.words.filter {
                            $0.lowercased().contains(self.searchTextField.lowercased())
                        }
                        await MainActor.run {
                            self.predictedValue = contains
                        }
                    } catch let error {
                        await self.showError(error)
                    }
                }
            }
            .store(in: &disposeBag)
    }
}
