//
//  Meal.swift
//  MealTracker
//
//  Created by KaranN on 1/3/18.
//  Copyright © 2018 KaranN. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {

    
    //Mark: Props
    struct PropKey {
        static let name = "name"
        static let rating = "rating"
        static let photo = "photo"
    }
    var name: String
    var rating: Int
    var photo: UIImage?
    
    //Mark: Init
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Init should fail if name is null or rating is less than 0
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating <= 5) && (rating >= 0) else {
            return nil
        }
        
        
        
        //Init stored props
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    // Mark: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropKey.name)
        aCoder.encode(photo, forKey: PropKey.photo)
        aCoder.encode(rating, forKey: PropKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropKey.rating)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating)
        
    }
    
    // Mark: Archiving paths
    
    //static let DocsDir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    //static let ArchiveURL = DocsDir.appendPathComponent("meals")
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
    
}
