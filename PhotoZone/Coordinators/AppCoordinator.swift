//
//  AppCoordinator.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 7/10/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator{

    private let window: UIWindow
    private var intialRootCoordinator: Coordinator!

    init(window: UIWindow) {
        self.window = window

    }
    func start() {

        let mainTabCoordinator = MainTabCoordinator(presenter: TabBarVC())
        self.intialRootCoordinator = mainTabCoordinator
        intialRootCoordinator.start()
        window.rootViewController = intialRootCoordinator.presenter
        window.makeKeyAndVisible()
    }

}
