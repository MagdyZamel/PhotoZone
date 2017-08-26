//
//  PhotosRepository.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/19/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import Moya
import Moya_Gloss

class PhotosRepository: PhotosRepoProtocol {
    
    private let provider = MoyaProvider<APIService>()

    func getPhotesWith(categoryName:String, pageNumber:Int, photoResult: PhotosResultProtocol) {
        provider.request(.getPhotoForCategory(category: categoryName, pageNumber: pageNumber)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let photosModel = try response.mapObject(PhotosModel.self)
                    photoResult.getPhotoSuccess(photosModel)

                } catch {
                    photoResult.getPhotoFailure()
                }
            case .failure:
                photoResult.getPhotoFailure()
            }
            
        }
    }
    
    func searchPhotesWith(key:String, pageNumber:Int, photoResult: PhotosResultProtocol) {
        provider.request(.search(term: key, pageNumber: pageNumber)) { (result) in
            
            switch result {
            case .success(let response):
                do {
                    let photosModel = try response.mapObject(PhotosModel.self)
                    photoResult.getPhotoSuccess(photosModel)
                } catch {
                    photoResult.getPhotoFailure()
                }
            case .failure:
                photoResult.getPhotoFailure()
            }
        }
    }


    

}
