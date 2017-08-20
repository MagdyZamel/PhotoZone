//
//  Photo.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/19/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import Gloss


class Photo : Decodable {
    let photoId:Int
    let name:String
    let description:String
    var url:URL?
    var takenAt:String
    
    let votesCount:Int
    let category:Int
    
    
    let owner :User?
    
    
    private let photoIdKey = "id"
    private let nameKey = "name"
    private let descriptionKey = "description"
    private let takenAtKey = "taken_at"
    private let votesCountKey = "votes_count"
    private let ownerKey = "user"
    private let urlKey = "image_url"
    private let categoryKey = "category"
    
    
    required init?(json data:JSON) {
        
        photoId  = (photoIdKey <~~ data)!
        name = (nameKey <~~ data)!
        if let descriptions:String = descriptionKey <~~ data{
            self.description = descriptions
        }else{
            self.description = ""
        }
        url = URL(string:(urlKey <~~ data)!)
        votesCount = (votesCountKey <~~ data)!
        owner = ownerKey <~~ data
        category = (categoryKey <~~ data)!
        takenAt = ""
        if let e:String = takenAtKey <~~ data {
            takenAt = convert(customDate:(e))
            
            
        }else{
            
            takenAt = ""
            
        }
        
    }
    
    func convert(customDate : String) ->String{
        if customDate == " " {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        let date = dateFormatter.date(from: customDate)
        dateFormatter.dateFormat = "EEEE, MMMM d, yyyy"
        dateFormatter.dateStyle = DateFormatter.Style.full
        if let date = date {
            let newDate = dateFormatter.string(from: date)
            return newDate
        }
        return ""
    }
}

