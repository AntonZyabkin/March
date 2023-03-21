//
//  HomeEndpoints.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Moya

enum HomeEndpoints {
    case getLatestViewed
    case getFlashSale
    case getWords
}

extension HomeEndpoints: TargetType {
    
    var headers: [String : String]? {
        switch self {
        case .getFlashSale, .getLatestViewed, .getWords:
            return [:]
        }
    }

    var baseURL: URL {
        switch self {
        case .getFlashSale, .getLatestViewed, .getWords:
            return URL(string: "https://run.mocky.io")!
        }
    }
    var path: String {
        switch self {
        case .getFlashSale:
            return "/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        case .getLatestViewed:
            return "/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        case .getWords:
            return "/v3/4c9cd822-9479-4509-803d-63197e5a9e19"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFlashSale, .getLatestViewed, .getWords:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getFlashSale, .getLatestViewed, .getWords:
            return .requestPlain
        }
    }
}
