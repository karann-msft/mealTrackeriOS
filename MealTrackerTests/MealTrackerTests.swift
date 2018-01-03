//
//  MealTrackerTests.swift
//  MealTrackerTests
//
//  Created by KaranN on 12/21/17.
//  Copyright © 2017 KaranN. All rights reserved.
//

import XCTest
@testable import MealTracker

class MealTrackerTests: XCTestCase {
    
    //Mark: meal class tests
    
    func testMealClassInit() {
        
        // zero rating
        let zeroRatingMeal = Meal.init(name: "zeroRatingMeal", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //highest positive raing
        let fiveRatingMeal = Meal.init(name: "fiveRatingMeal", photo: nil, rating: 5)
        XCTAssertNotNil(fiveRatingMeal)
        
        // rating > 5
        let largeRatingMeal = Meal.init(name: "largeRatingMeal", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        //return nil for negative rating or name is nil
        let negativeRatingMeal = Meal.init(name: "negativeRatingMeal", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        let nilNameMeal = Meal.init(name: "", photo: nil, rating: 5)
        XCTAssertNil(nilNameMeal)
        
        
    }
    
}
