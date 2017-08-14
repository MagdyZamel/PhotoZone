//
//  SearchViewProtocol.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/19/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
protocol SearchViewProtocol:class{

    func showMorePhotos(photos: [Photo])
    func searchPhotos(photos: [Photo])
    func searchLoadFailure()
    func startLoading()
    func stopLoading()
    func showNoResult()
    func showInternetError()
}

