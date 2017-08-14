//
//  TabBarCoordinator.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 7/10/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import UIKit
protocol TabBarCoordinator:Coordinator {
    var tabBarController:UITabBarController { get }
}

extension TabBarCoordinator {
    var presenter:UIViewController{
        return tabBarController as UIViewController
    }

}
