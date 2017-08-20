//
//  PageViewProtocol.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/19/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation

protocol PageViewProtocol:class{

    func showMorePhotos(photos: [Photo])
    func showPhotos(photos: [Photo])
    func showLoading()
    func hideLoading()
    func showLoadFailure()

}
