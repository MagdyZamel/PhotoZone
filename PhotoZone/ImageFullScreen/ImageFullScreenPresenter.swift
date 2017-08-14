//
//  ImageFullScreenPresenter.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/26/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import Kingfisher

class ImageFullScreenPresenter {

    weak var photoImageView : ImageFullScreenViewProtocol!
    var photoDataSource : Photo!


    init(photoImageView:ImageFullScreenViewProtocol,photoDataSource :Photo) {
        self.photoImageView = photoImageView
        self.photoDataSource = photoDataSource
        photoImageView.showLoading()
        photoImageView.showPhotoFullScreen(photoDataSource)
    }


}
