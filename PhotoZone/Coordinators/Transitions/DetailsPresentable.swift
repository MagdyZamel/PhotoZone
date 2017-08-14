//
//  DetailsPresentable.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 7/10/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
protocol DetailsPresentable {
    func showImageInFullScreen(image: Photo)
}

extension DetailsPresentable where Self: Coordinator {

    func showImageInFullScreen(image: Photo){
        let imageFullScreenCoordinator = ImageFullScreenCoordinator(presenter: self.presenter, dataSource: image)
            imageFullScreenCoordinator.start()
    }

}
