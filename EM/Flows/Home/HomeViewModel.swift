//
//  HomeViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Combine
import SwiftUI


//TODO: что такое
@MainActor
final class HomeViewModel: ObservableObject {
    private let shopApiService: ShopAPIServicable
    
    @Published var searchTextFielt: String = ""
    @Published var homeModel = HomeModel.skelet
    private var disposeBag = Set<AnyCancellable>()
    init(shopApiService: ShopAPIServicable) {
        self.shopApiService = shopApiService
        searchWords()
    }
    
    private func showError(_ error: Error) async {
        await MainActor.run {
            print(error)
        }
    }
}


extension HomeViewModel {
    func fetchPhoto(url: String) throws -> Image {
        
        //TODO: Synchronous URL loading of https://assets.reebok.com/images/h_2000... should not occur on this application's main thread as it may lead to UI unresponsiveness. Please switch to an asynchronous networking API such as URLSession.
        
        guard let url = URL(string: url) else { return Image(systemName: "bell")}
        //        let (data, _) =  URLSession.shared.data(from: url)
        let data = try Data(contentsOf: url)
        return Image(data: data)!
    }
    
    func getlatest() {
        Task(priority: .userInitiated) {
            do {
                let flashSale = try await shopApiService.getFlashSale()
                let latestViewed = try await shopApiService.getLatestViewed()
                
                let flashSaleItems = try flashSale.flashSale.map {
                    let image = try fetchPhoto(url: $0.imageURL)
                    return FlashSaleItem(itemImage: image, data: $0)
                }
                
                let latestItems = try latestViewed.latest.map {
                    let image = try fetchPhoto(url: $0.imageURL)
                    return LatestItem(itemImage: image, data: $0)
                }
                
                await MainActor.run {
                    homeModel = HomeModel(latestItems: latestItems, flashSaleItems: flashSaleItems)
                }
            } catch let error as NetworkError {
                await showError(error)
            }
        }
    }
    
    func searchWords() {
        $searchTextFielt
            .debounce(for: 1, scheduler: RunLoop.current)
            .sink {_ in
//                print($0)
                Task {
                    do {
                        let words = try await self.shopApiService.getWords()
                        let contains = words.words.filter { value in
                            value.contains(self.searchTextFielt)
                        }
                        await MainActor.run {
                            print(contains)
                        }
                    } catch let error {
                        //TODO: как вызывать ошибку в mainActor?
                        await self.showError(error)
                    }
                }

            }
            .store(in: &disposeBag)
    }
}


//TODO: перенеси  в экстеншены
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
