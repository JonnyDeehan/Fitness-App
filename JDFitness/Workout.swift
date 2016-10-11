//
//  Workout.swift
//  JDFitness
//
//  Created by Jonathan Deehan on 10/10/2016.
//  Copyright © 2016 jdblogs. All rights reserved.
//

import Foundation

struct Workout {
    
    private var workoutType:String
    private var date:String
    private var startTime:String
    private var endTime:String
    private var duration:String
    private var distance:String
    private var energyBurned:String
    
    init(workoutType:String, date:String, startTime:String, endTime:String, duration:String, distance:String, energyBurned:String) {
        self.workoutType = workoutType
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.duration = duration
        self.distance = distance
        self.energyBurned = energyBurned
    }
    
    func getWorkoutType() -> String {
        return workoutType
    }
    
    func getDate() -> String {
        return date
    }
    
    func getStartTime() -> String {
        return startTime
    }
    
    func getEndTime() -> String {
        return endTime
    }
    
    func getDuration() -> String {
        return duration
    }
    
    func getDistance() -> String {
        return distance
    }
    
    func getEnergyBurned() -> String {
        return energyBurned
    }
    
}
