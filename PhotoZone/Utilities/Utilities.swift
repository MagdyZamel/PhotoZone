//
//  Utilities.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/9/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import UIKit

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
