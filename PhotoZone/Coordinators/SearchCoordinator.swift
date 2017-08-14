//
//  SearchCoordinator.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 7/10/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import UIKit
class SearchCoordinator: Coordinator,DetailsPresentable {

    let  presenter: UIViewController

    init() {
        self.presenter = SearchVC()
    }

    func start() {
        if let searchVC  = presenter as? SearchVC{
            searchVC.showImageInFullScreen = showImageInFullScreen
        }
    }
    
    
}
