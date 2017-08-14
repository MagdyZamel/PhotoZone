//
//  MainTabCoordinator.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 7/10/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import UIKit

 class MainTabCoordinator: TabBarCoordinator {

    let tabBarController: UITabBarController
    private var childCoordinators: [Coordinator]!

    init(presenter: UITabBarController) {
        self.tabBarController = presenter
    }

    func start() {
        let searchCoordinator = SearchCoordinator()
        let homeCoordinator = HomeCoordinator()
        self.childCoordinators =  [homeCoordinator, searchCoordinator]

        
        childCoordinators.forEach { coordinator in
            coordinator.start()
        }
//
//        let vcS = childCoordinators.map { (coordinator) -> UIViewController in
//
//    return coordinator.presenter
//
//        }

        tabBarController.setViewControllers(childCoordinators.map { $0.presenter },animated: false)
    }
}
