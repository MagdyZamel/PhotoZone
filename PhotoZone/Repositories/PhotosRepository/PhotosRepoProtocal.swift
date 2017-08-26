//
//  PhotosRepoProtocol.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/19/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation

protocol PhotosRepoProtocol:class{

    func getPhotesWith(categoryName:String, pageNumber:Int, photoResult: PhotosResultProtocol)
    func searchPhotesWith(key:String, pageNumber:Int, photoResult: PhotosResultProtocol)
}

protocol PhotosResultProtocol:class{

    func getPhotoSuccess(_ photosModel: PhotosModel )
    func getPhotoFailure()
}
