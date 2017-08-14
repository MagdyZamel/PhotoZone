//
//  PhotosRepoProtocol.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/19/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation

protocol PhotosRepoProtocol:class{

    func getPhotesWith(categoryName:String, pageNumber:Int, photoResult: OnPhotosResultProtocol)
    func searchPhotesWith(key:String, pageNumber:Int, photoResult: OnPhotosResultProtocol)
}

protocol OnPhotosResultProtocol:class{

    func getPhotoOnSuccess(_ photosModel: PhotosModel )
    func getPhotoOnFailure()
}
