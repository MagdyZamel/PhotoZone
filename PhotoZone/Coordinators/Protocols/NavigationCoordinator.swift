//
//  NavigationCoordinator.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 7/10/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import  UIKit

protocol NavigationCoordinator :Coordinator{
    var navigationController: UINavigationController { get }

}
extension NavigationCoordinator{
    var presenter: UIViewController {
     return navigationController as UIViewController
    }

}
