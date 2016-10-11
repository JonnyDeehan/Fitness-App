//
//  User.swift
//  JDFitness
//
//  Created by Jonathan Deehan on 28/09/2016.
//  Copyright © 2016 jdblogs. All rights reserved.
//

import Foundation

class User {
    
    fileprivate var weight: String // Measured in kg
    fileprivate var height: String // Measured in ft
    fileprivate var age: String
    fileprivate var primaryGoal: String
    fileprivate var secondaryGoal: String
    fileprivate var gymAccess: String
    fileprivate var hours: String
    
    init(weight: String, height: String, age: String, primaryGoal: String, secondaryGoal: String, gymAccess: String, hours: String){
        self.weight = weight
        self.height = height
        self.age = age
        self.primaryGoal = primaryGoal
        self.secondaryGoal = secondaryGoal
        self.gymAccess = gymAccess
        self.hours = hours
    }
    
    func getWeight() -> String {
        return weight
    }
    
    func getHeight() -> String {
        return height
    }
    
    func getAge() -> String {
        return age
    }
    
    func getPrimaryGoal() -> String {
        return primaryGoal
    }
    
    func getSecondaryGoal() -> String {
        return secondaryGoal
    }
    
    func getGymAccess() -> String {
        return gymAccess
    }
    
    func getWeeklyHours() -> String {
        return hours
    }
}
