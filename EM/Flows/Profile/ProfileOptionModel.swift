//
//  ProfileOptionModel.swift
//  EM
//
//  Created by Anton Zyabkin on 20.03.2023.
//

import Foundation

struct ProfileElement: Identifiable {
    static let profileElements = [
        
        ProfileElement(icon: Asset.Profile.folder,
                       title: L10n.Profile.tradeStore,
                       isEditable: true,
                       type: .tradeStore),
        ProfileElement(icon: Asset.Profile.folder,
                       title: L10n.Profile.paymentMethod,
                       isEditable: true,
                       type: .paymentMethod),
        ProfileElement(icon: Asset.Profile.folder,
                       title: L10n.Profile.balance,
                       aditionalInfo: "1593",
                       isEditable: false, type: .balance),
        ProfileElement(icon: Asset.Profile.folder,
                       title: L10n.Profile.tradeHistory,
                       isEditable: true,
                       type: .tradeHistory),
        ProfileElement(icon: Asset.Profile.refrash,
                       title: L10n.Profile.restorePurchase,
                       isEditable: true,
                       type: .restorePurchase),
        ProfileElement(icon: Asset.Profile.help,
                       title: L10n.Profile.help,
                       isEditable: false,
                       type: .help),
        ProfileElement(icon: Asset.Profile.logOut,
                       title: L10n.Profile.logOut,
                       isEditable: false,
                       type: .logOut)
    ]
    
    let id = UUID()
    let icon: ImageAsset
    let title: String
    let additionalInfo: String?
    let isEditable: Bool
    let type: ElementType
    
    init(icon: ImageAsset, title: String, aditionalInfo: String?, isEditable: Bool, type: ElementType) {
        self.icon = icon
        self.title = title
        self.additionalInfo = aditionalInfo
        self.isEditable = isEditable
        self.type = type
    }
    
    init(icon: ImageAsset, title: String, isEditable: Bool, type: ElementType) {
        self.icon = icon
        self.title = title
        self.additionalInfo = nil
        self.isEditable = isEditable
        self.type = type
    }
}

enum ElementType {
    case tradeStore
    case paymentMethod
    case balance
    case tradeHistory
    case restorePurchase
    case help
    case logOut
}
