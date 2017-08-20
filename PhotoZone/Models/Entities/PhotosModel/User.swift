//
//  User.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/9/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import Gloss


class User:Decodable{
    
    let fullName :String?
    var userPicUrl :URL?
    let userId:Int?
    
   private let fullNameKey  = "fullname"
   private let userPicUrlKey = "userpic_url"
   private let userIdKey = "id"
    
    
    
    required init?(json data:JSON){
        
        userId  = userIdKey <~~ data
        fullName  = fullNameKey <~~ data
        userPicUrl =  URL(string :(userPicUrlKey <~~ data)!)
        
    }
    
}
