//
//  LunchDTO.swift
//  iTrackLunch
//
//  Created by Mark Himmelsbach on 07.04.16.
//  Copyright © 2016 de.stocard.iTrackLunch. All rights reserved.
//

import Foundation
import UIKit

class Lunch: NSObject, NSCoding {
    
    var title: String?
    var rating: Float?
    var locationName: String?
    var lunchDate: NSDate?
    var image: UIImage?
    
    init(title: String?, rating:Float?, locationName : String?, lunchDate: NSDate?, image: UIImage?){
        super.init()
        self.title = title
        self.rating = rating
        self.locationName = locationName
        self.lunchDate = lunchDate
        self.image = image
    }
    
    //MARK: - NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.title = aDecoder.decodeObjectForKey("title") as? String
        self.rating = aDecoder.decodeObjectForKey("rating") as? Float
        self.locationName = aDecoder.decodeObjectForKey("locationName") as? String
        self.lunchDate = aDecoder.decodeObjectForKey("lunchDate") as? NSDate
        self.image = aDecoder.decodeObjectForKey("image") as? UIImage
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(rating, forKey: "rating")
        aCoder.encodeObject(locationName, forKey: "locationName")
        aCoder.encodeObject(lunchDate, forKey: "lunchDate")
        aCoder.encodeObject(image, forKey: "image")
    }
}