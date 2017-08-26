//
//  APIService.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/11/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import Moya

enum APIService {
    case getPhotoForCategory(category:String , pageNumber:Int)
    case search(term:String , pageNumber:Int)
}

extension APIService: TargetType {

    var baseURL: URL { return URL(string: Singleton.baseDomain)! }
    
    var path:String{
        switch self {
        case .getPhotoForCategory:
            return "/v1/photos"
        case .search:
            return "/v1/photos/search"
        }

    }
    
    var method: Moya.Method {
        switch self {
        case .getPhotoForCategory,.search:
            return .get
        }
    }
    var parameters: [String: Any]? {
        
        switch self {
        case .getPhotoForCategory(let category, let pageNumber):
            return ["only":category,"sort":"created_at","image_size":"4","page":"\(pageNumber)","consumer_key":Singleton.consumerKey]
        case .search(let term , let pageNumber):
            return ["term":term,"image_size":"4","page":"\(pageNumber)","consumer_key":Singleton.consumerKey]
        }

    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getPhotoForCategory, .search:
            return URLEncoding.default // Send parameters in URL
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getPhotoForCategory, .search:
            return Data()
        }
    }
    var task: Task {
        switch self {
        case .getPhotoForCategory, .search:
            return .request
        }
    }



}
