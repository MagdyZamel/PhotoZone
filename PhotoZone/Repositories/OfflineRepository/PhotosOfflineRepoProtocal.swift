//
//  PhotosOfflineRepoProtocol.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/26/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
protocol PhotosOfflineRepoProtocol:class {
    
}

protocol OnPhotoResultOfflineProtocol :class{

    func loadPhotosOnSuccess(_ photos: [Photo] )
    func loadPhotoOnFailure()

    func savePhotosOnSuccess(_ photo: Photo )
    func savePhotoOnFailure(_ photo: Photo)

}
