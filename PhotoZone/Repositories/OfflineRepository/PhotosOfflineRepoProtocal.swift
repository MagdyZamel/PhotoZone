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

protocol PhotoResultOfflineProtocol :class{

    func loadPhotosSuccessed(_ photos: [Photo] )
    func loadPhotoFailure()

    func savePhotosSuccess(_ photo: Photo )
    func savePhotoFailure(_ photo: Photo)

}
