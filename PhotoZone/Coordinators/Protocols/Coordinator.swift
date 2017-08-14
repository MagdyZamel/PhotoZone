//
//  Coordinator.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 7/10/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import  UIKit

protocol Coordinator  : class{
    var presenter: UIViewController { get }
    
    func start()

}

