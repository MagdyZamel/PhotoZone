
//
//  ImageFullScreenViewProtocol.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/26/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation

protocol ImageFullScreenViewProtocol:class {
    func showPhotoFullScreen(_ photo:Photo)
    func showLoading()
    func hideLoading()

}
