//
//  ImageFullScreenCoordinator.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 7/10/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import UIKit



class ImageFullScreenCoordinator: Coordinator,DetailsPresentable{

    let  presenter: UIViewController
    let dataSource:Photo

    init(presenter: UIViewController,dataSource:Photo) {
        self.presenter = presenter
        self.dataSource = dataSource

    }

    func start() {
        debugPrint(dataSource.name)
        let imageFullScreenVC = ImageFullScreenVC()
        let imageFullScreenPresenter = ImageFullScreenPresenter(photoImageView: imageFullScreenVC, photoDataSource: dataSource)
        imageFullScreenVC.presenter = imageFullScreenPresenter
        presenter.presentVC(imageFullScreenVC)
    }
    
    
}

