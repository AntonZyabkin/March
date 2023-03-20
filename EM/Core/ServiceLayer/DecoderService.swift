//
//  DecoderService.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation

protocol DecoderServicable{
    func decode<T: Decodable>(_ data: Data) throws -> T
    func encode<T: Encodable>(_ data: T) throws -> Data
}

final class DecoderService{
    private let jsonDecoder = JSONDecoder()
    private let jsonEncoder = JSONEncoder()
}

extension DecoderService: DecoderServicable {
    func decode<T: Decodable>(_ data: Data) throws -> T {
        try self.jsonDecoder.decode(T.self, from: data)
    }
    func encode<T: Encodable>(_ data: T) throws -> Data {
        try self.jsonEncoder.encode(data)
    }
}
