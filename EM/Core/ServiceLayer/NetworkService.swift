//
//  NetworkService.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Moya

protocol Networkable {
    func requestAsync<T: Decodable>(_ target: TargetType) async throws -> T
}

final class NetworkService {
    private let decoderService: DecoderServicable
    private let provider = MoyaProvider<MultiTarget>()
    init(decoderService: DecoderServicable) {
        self.decoderService = decoderService
    }
}

enum NetworkError: Error {
    case selfError
    case responseError
    case unknownError
    case decodeError(Error)
}

extension NetworkService: Networkable {
    func requestAsync<T: Decodable>(_ target: TargetType) async throws -> T {
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            
            guard let self else {
                continuation.resume(throwing: NetworkError.selfError)
                return
            }
            
            let multiTarget = MultiTarget(target)
            provider.request(multiTarget) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let response):
                    guard let urlResponse = response.response else {
                        let error = NetworkError.responseError
                        continuation.resume(throwing: error)
                        return
                    }
                    switch urlResponse.statusCode {
                    case 200...599:
                        print("Status code \(urlResponse.statusCode)")
                        do {
                            let decodeResponce: T = try self.decoderService.decode(response.data)
                            continuation.resume(returning: decodeResponce)
                        } catch let error {
                            continuation.resume(throwing: NetworkError.decodeError(error))
                        }
                    default:
                        continuation.resume(throwing: NetworkError.unknownError)
                    }
                }
            }
        }
    }
}
