//
//  KeychainService.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation
import KeychainSwift

protocol KeychainServicable {
    func deleteItem(for key: String) -> Bool
    func save(_ value: String, for key: String) -> Bool
    func save(_ value: User) -> Bool
    func fetch(for key: String) -> String?
    func fetchUser(for key: String) -> User?
}

final class KeychainService{
    let decoder: DecoderServicable
    let keyChain = KeychainSwift()
    init(decoder: DecoderServicable) {
        self.decoder = decoder
    }
}

extension KeychainService: KeychainServicable {
    
    func deleteItem(for key: String) -> Bool {
        keyChain.delete(key)
    }
    
    func save(_ value: String, for key: String) -> Bool {
        keyChain.set(value, forKey: key)
    }
    
    func save(_ value: User) -> Bool {
        do {
            let data = try decoder.encode(value)
            return keyChain.set(data, forKey: value.firstName)
        } catch {
            print("error decoder.encode")
            return false
        }
    }
    
    func fetch(for key: String) -> String? {
        keyChain.get(key)
    }
    
    func fetchUser(for key: String) -> User? {
        guard let data = keyChain.getData(key) else {
            return nil
        }
        do {
            let user: User = try decoder.decode(data)
            return user
        } catch {
            print("error decoder.decode")
            return nil
        }
    }
}


//TODO: удали ключи, если не нужны
extension KeychainSwift {
    enum Keys: String {
        case login = "login"
    }
}
