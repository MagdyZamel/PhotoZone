//
//  Utilities.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/9/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import UIKit

let notificationCenter = NotificationCenter.default
let userData  = UserDefaults.standard
let BASEDOMAIN = "https://api.500px.com"

let CONSUMERKEY = "0SS3Gn7GECTZfD29Emq3ZyGS0VB0EPm3KPg5N6TK"

let categories = [
    0 :"Uncategorized",10:"Abstract",11:"Animals",
    5:"Black and White",1:"Celebrities",9:"City and Architecture",15:"Commercial",16:"Concert",
    20:"Family",14:"Fashion",2:"Film",24:"Fine Art",23:"Food",3:"Journalism",
    8:"Landscapes",12:"Macro",18:"Nature",7:"People",19:"Performing Arts",17:"Sport",
    6:"Still Life",21:"Street",26:"Transportation",13:"Travel",22:"Underwater",
    //  4:"Nude",
    27:"Urban Exploration",25:"Wedding"
]

let notificationName = Notification.Name("request fail")

enum MethodType {
    case getAllPhotos
    case searchWithKey
    
}

extension UIViewController{
    
    func presentAlert(title:String? , message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil));
        self.present(alert, animated: true, completion: nil)
    }
}

extension NSDictionary {
    func getValueOf<T>(key:String,callback:T)  -> T{
        guard let value  = self[key] as? T else{
            return callback
        }
        return value
    }
}
