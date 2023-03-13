//
//  ShowEndpoints.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Moya

enum ShopEndpoints {
    case getLatestViewed
    case getFlashSale
}

extension ShopEndpoints: TargetType {
    
    var headers: [String : String]? {
        switch self {
        case .getFlashSale, .getLatestViewed:
            return [:]
        }
    }

    var baseURL: URL {
        switch self {
        case .getFlashSale, .getLatestViewed:
            //TODO: intup real URL
            return URL(string: "")!
        }
    }
    var path: String {
        //TODO: intup real path
        switch self {
        case .getFlashSale:
            return ""
        case .getLatestViewed:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFlashSale, .getLatestViewed:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getFlashSale, .getLatestViewed:
            return .requestPlain
        }
    }
}
