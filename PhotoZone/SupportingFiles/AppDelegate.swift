//
//  AppDelegate.swift
//  PhotoZone
//
//  Created by Magdi Zamel on 6/7/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator:AppCoordinator!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)

        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()

        return true
    }
    

}
