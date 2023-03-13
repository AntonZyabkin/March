//
//  KeychainService.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation
import Security
import SwiftKeychainWrapper

protocol KeychainServicable {
    func save(_ value: String, for key: KeychainWrapper.Keys) -> Bool
    func fetch(for key: KeychainWrapper.Keys) -> String?
    func deleteItem(for key: KeychainWrapper.Keys) -> Bool
    func deleteAll() -> Bool
}

final class KeychainService{
    
    let decoder: DecoderServicable
    
    init(decoder: DecoderServicable) {
        self.decoder = decoder
    }
    enum KeychainError: Error {
        case itemNotFound
        case duplicateItem
        case invalidItemFormat
        case unexpectedStatus(OSStatus)
        case innNotFound
    }
}

extension KeychainService: KeychainServicable {
    func save(_ value: String, for key: KeychainWrapper.Keys) -> Bool {
        KeychainWrapper.standard.set(value, forKey: key.rawValue)
    }
    
    func fetch(for key: KeychainWrapper.Keys) throws -> String  {
        guard let result = KeychainWrapper.standard.string(forKey: key.rawValue) else {
            throw KeychainError.innNotFound
        }
        return result
    }
        
    func fetch(for key: KeychainWrapper.Keys) -> String? {
        KeychainWrapper.standard.string(forKey: key.rawValue)
    }
    
    func deleteItem(for key: KeychainWrapper.Keys) -> Bool {
        KeychainWrapper.standard.removeObject(forKey: key.rawValue)
    }
    
    func deleteAll() -> Bool {
        KeychainWrapper.standard.removeAllKeys()
    }
}

extension KeychainWrapper {
    enum Keys: String {
        case login = "login"
    }
}
