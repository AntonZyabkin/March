//
//  ProfileViewModel.swift
//  EM
//
//  Created by Anton Zyabkin on 15.03.2023.
//

import Combine
final class ProfileViewModel: ObservableObject {
    
    let logOut: () -> Void

    init(logOut: @escaping () -> Void) {
        self.logOut = logOut
    }
    func elementAction(_ type: ElementType) -> () -> Void {
        switch type {
        case .logOut:
            return logOut
        default:
            return {}
        }
    }
}

