//
//  DecoderService.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation

protocol DecoderServicable{
    func decode<T: Decodable>(_ data: Data) throws -> T
}

final class DecoderService{
    private let jsonDecoder = JSONDecoder()
}

extension DecoderService: DecoderServicable {
    func decode<T: Decodable>(_ data: Data) throws -> T {
        try self.jsonDecoder.decode(T.self, from: data)
    }
}
