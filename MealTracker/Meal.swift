//
//  Meal.swift
//  MealTracker
//
//  Created by KaranN on 1/3/18.
//  Copyright © 2018 KaranN. All rights reserved.
//

import UIKit

class Meal {
    
    //Mark: Props
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
}
