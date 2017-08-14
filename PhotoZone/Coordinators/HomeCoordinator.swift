//
//  HomeCoordinator.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 7/10/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator,DetailsPresentable{

    let  presenter: UIViewController

    init() {
        self.presenter = HomeVC()
    }

    func start() {
        //Walahy ana msh 3aref a3mel eh hena ana b2aly sa3teen 3ashn a3raf a7ot el line da feen :( :( :(
        if let homeVC  = presenter as? HomeVC{
            // how ana keda 3amel ratin cycle???
            homeVC.showImageInFullScreen = showImageInFullScreen
        }
    }


}
