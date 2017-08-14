//
//  Photo.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/9/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import Gloss

class PhotosModel : Decodable {

    private let photosKey = "photos"
    var photos:[Photo]?

    required init?(json data:JSON){
        photos = photosKey <~~ data
    }
}

