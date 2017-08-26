//
//  Singleton.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 8/1/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation

enum Singleton {

    static let userDefaults = UserDefaults.standard
    static let baseDomain = "https://api.500px.com"
    static let notificationCenter = NotificationCenter.default
    static let consumerKey = "0SS3Gn7GECTZfD29Emq3ZyGS0VB0EPm3KPg5N6TK"
    static let photoCategories = [
        0 :"Uncategorized",10:"Abstract",11:"Animals",
        5:"Black and White",1:"Celebrities",9:"City and Architecture",15:"Commercial",16:"Concert",
        20:"Family",14:"Fashion",2:"Film",24:"Fine Art",23:"Food",3:"Journalism",
        8:"Landscapes",12:"Macro",18:"Nature",7:"People",19:"Performing Arts",17:"Sport",
        6:"Still Life",21:"Street",26:"Transportation",13:"Travel",22:"Underwater",
        //  4:"Nude",
        27:"Urban Exploration",25:"Wedding"
    ]

}

