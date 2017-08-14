//
//  TabBarController.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/9/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//


import UIKit

class TabBarVC: UITabBarController {
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

      self.viewControllers?.forEach({ (vc) in
        var tabBarItem:UITabBarItem!
        if let _  = vc as? HomeVC{
             tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "HomeUnselected.png"), selectedImage: UIImage(named: "HomeSelected.png"))
        }
        if let _  = vc as? SearchVC{
            tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "SearchUnSelected.png"), selectedImage: UIImage(named: "SearchSelected.png"))
        }
        vc.tabBarItem = tabBarItem
     })
}
    

}
