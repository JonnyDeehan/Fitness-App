//
//  Fitness.swift
//  JDFitness
//
//  Created by Jonathan Deehan on 28/09/2016.
//  Copyright © 2016 jdblogs. All rights reserved.
//

import Foundation

/**
 * Custom workout plan determines the best workout
 * regime for the user based on their entered info
 */

class Fitness {
    
    // Arrays to store the custom workout routine
    var workoutArray:[[String]] = []
    var mondayPlan:[String] = []
    var tuesdayPlan:[String] = []
    var wednesdayPlan:[String] = []
    var thursdayPlan:[String] = []
    var fridayPlan:[String] = []
    var saturdayPlan:[String] = []
    var sundayPlan:[String] = []
    
    /*
     :parm: user: UserInfo contains the user information
     :returns: workoutArray
     */
    func determineUserAnswers(_ user: UserInfo) -> [[String]]{
        if ((Int(user.age!)!) > 16) {
            // User is older than 16
            print(user.gymAccess!)
            if ((user.gymAccess!) == "Has access to a gym") {
                // User has gym access
                return generateGymWorkoutPlan(user)
            }
            else {
                // User does not have gym access
                return generateWorkoutPlan(user)
            }
        }
        else {
            // User is younger than 16
            print("User is younger than 16... cannot use this app")
        }
        return workoutArray
    }
    
    // Combine the individual workout plans for each day in one array
    func completePlan(){
        workoutArray.append(mondayPlan)
        workoutArray.append(tuesdayPlan)
        workoutArray.append(wednesdayPlan)
        workoutArray.append(thursdayPlan)
        workoutArray.append(fridayPlan)
        workoutArray.append(saturdayPlan)
        workoutArray.append(sundayPlan)
    }
    
    /*
     :parm: user: UserInfo - contains the user information
     :returns: The custom workout plan for a user who does
     * not have gym access
     */
    func generateWorkoutPlan(_ user: UserInfo) -> [[String]] {
        switch user.hours! {
        // 1-2 Hours
        case "1-2 hours":
            // LOSE WEIGHT AND GAIN MUSCLE
            if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Muscle") || (user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 4 Sets of 10-12")
                mondayPlan.append("Tricep Dips - 4 Sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute Jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Chin ups - 3 sets of 10-12")
                wednesdayPlan.append("Pull ups - 3 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute Jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 4 Sets of 10-12")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute Jog")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
            // LOSE WEIGHT AND GAIN STRENGTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 4 sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Pull ups - 4 sets of 10")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squat jumps - 5 sets of 10")
                fridayPlan.append("Crunches - 4 sets of 10")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute jog")
                sundayPlan.append("Sprints")
                sundayPlan.append("5 minute jog warmup")
                sundayPlan.append("10 minute Hamstring and Quad Stretch")
                sundayPlan.append("3 sets of 100 meter sprints")
                completePlan()
                return workoutArray
            }
            // LOSE WEIGHT AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Lose Weight")) {
                mondayPlan.append("Cardio")
                mondayPlan.append("20 minute jog")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Cardio")
                wednesdayPlan.append("20 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute jog")
                fridayPlan.append("Cardio")
                fridayPlan.append("20 minute jog")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute jog")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
            // GAIN MUSCLE AND GAIN STRENGTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 4 Sets of 10-12")
                mondayPlan.append("Tricep Dips - 4 Sets of 10-12")
                tuesdayPlan.append("Rest")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Chin ups - 3 sets of 10-12")
                wednesdayPlan.append("Pull ups - 3 sets of 10-12")
                thursdayPlan.append("Rest")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 4 Sets of 10-12")
                saturdayPlan.append("Rest")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
            // GAIN MUSCLE AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 4 Sets of 10-12")
                mondayPlan.append("Tricep Dips - 4 Sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute Jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Chin ups - 3 sets of 10-12")
                wednesdayPlan.append("Pull ups - 3 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute Jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 4 Sets of 10-12")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute Jog")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
            // GAIN STRENGTH AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Strength")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 4 sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Pull ups - 4 sets of 10")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squat jumps - 5 sets of 10")
                fridayPlan.append("Crunches - 4 sets of 10")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute jog")
                sundayPlan.append("Sprints")
                sundayPlan.append("5 minute jog warmup")
                sundayPlan.append("10 minute Hamstring and Quad Stretch")
                sundayPlan.append("3 sets of 100 meter sprints")
                completePlan()
                return workoutArray
            }
            return workoutArray
        // 2-4 Hours
        case "2-4 hours":
            // LOSE WEIGHT AND GAIN MUSCLE
            if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Muscle") || (user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 5 Sets of 10-12")
                mondayPlan.append("Tricep Dips - 5 Sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute Jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Chin ups - 5 sets of 10-12")
                wednesdayPlan.append("Pull ups - 5 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute Jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 6 Sets of 10-12")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute Jog")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute Jog")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND GAIN STRENGTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 6 sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Pull ups - 4 sets of 10")
                wednesdayPlan.append("Chinups - 4 sets of 10")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squat jumps - 4 sets of 10")
                fridayPlan.append("Lunges - 4 sets of 10")
                fridayPlan.append("Leg raises - 3 sets of 10")
                fridayPlan.append("Crunches - 3 sets of 10")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute jog")
                sundayPlan.append("Sprints")
                sundayPlan.append("10 minute jog warmup")
                sundayPlan.append("10 minute Hamstring and Quad Stretch")
                sundayPlan.append("6 sets of 100 meter sprints")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Lose Weight")) {
                mondayPlan.append("Cardio")
                mondayPlan.append("30 minute jog")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("30 minute jog")
                wednesdayPlan.append("Cardio")
                wednesdayPlan.append("30 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("30 minute jog")
                fridayPlan.append("Cardio")
                fridayPlan.append("30 minute jog")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("30 minute jog")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND GAIN STRENGTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 5 Sets of 10-12")
                mondayPlan.append("Tricep Dips - 5 Sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute Jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Chin ups - 5 sets of 10-12")
                wednesdayPlan.append("Pull ups - 5 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute Jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 6 Sets of 10-12")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute Jog")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute Jog")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 5 Sets of 10-12")
                mondayPlan.append("Tricep Dips - 5 Sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute Jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Chin ups - 5 sets of 10-12")
                wednesdayPlan.append("Pull ups - 5 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute Jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 6 Sets of 10-12")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute Jog")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute Jog")
                completePlan()
                return workoutArray
            }
                // GAIN STRENGTH AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Strength")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 6 sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Pull ups - 4 sets of 10")
                wednesdayPlan.append("Chinups - 4 sets of 10")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squat jumps - 4 sets of 10")
                fridayPlan.append("Lunges - 4 sets of 10")
                fridayPlan.append("Leg raises - 3 sets of 10")
                fridayPlan.append("Crunches - 3 sets of 10")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute jog")
                sundayPlan.append("Sprints")
                sundayPlan.append("10 minute jog warmup")
                sundayPlan.append("10 minute Hamstring and Quad Stretch")
                sundayPlan.append("6 sets of 100 meter sprints")
                completePlan()
                
                return workoutArray
            }
            return workoutArray
        // 4-6 Hours
        case "4-6 hours":
            // LOSE WEIGHT AND GAIN MUSCLE
            if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Muscle") || (user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 6 Sets of 10-12")
                mondayPlan.append("Tricep Dips - 6 Sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute Jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Chin ups - 6 sets of 10-12")
                wednesdayPlan.append("Pull ups - 6 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute Jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 6 Sets of 10-12")
                fridayPlan.append("Crunches - 3 sets of 15")
                fridayPlan.append("Leg raises - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute Jog")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute Jog")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND GAIN STRENGTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 6 sets of 10")
                mondayPlan.append("Tricep Dips - 6 Sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Pull ups - 5 sets of 10")
                wednesdayPlan.append("Chinups - 5 sets of 10")
                wednesdayPlan.append("20 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squat jumps - 4 sets of 10")
                fridayPlan.append("Lunges - 4 sets of 10")
                fridayPlan.append("Leg raises - 4 sets of 10")
                fridayPlan.append("Crunches - 4 sets of 10")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute jog")
                sundayPlan.append("Sprints")
                sundayPlan.append("10 minute jog warmup")
                sundayPlan.append("10 minute Hamstring and Quad Stretch")
                sundayPlan.append("6 sets of 100 meter sprints")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Lose Weight")) {
                mondayPlan.append("Cardio")
                mondayPlan.append("40 minute jog")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("40 minute jog")
                wednesdayPlan.append("Cardio")
                wednesdayPlan.append("40 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("40 minute jog")
                fridayPlan.append("Cardio")
                fridayPlan.append("40 minute jog")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("40 minute jog")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND GAIN STRENGTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 6 Sets of 10-12")
                mondayPlan.append("Tricep Dips - 6 Sets of 10-12")
                tuesdayPlan.append("Rest")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Chin ups - 6 sets of 10-12")
                wednesdayPlan.append("Pull ups - 6 sets of 10-12")
                thursdayPlan.append("Rest")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 6 Sets of 10-12")
                fridayPlan.append("Crunches - 3 sets of 15")
                fridayPlan.append("Leg raises - 3 sets of 15")
                saturdayPlan.append("Rest")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 6 Sets of 10-12")
                mondayPlan.append("Tricep Dips - 6 Sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute Jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Chin ups - 6 sets of 10-12")
                wednesdayPlan.append("Pull ups - 6 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute Jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 6 Sets of 10-12")
                fridayPlan.append("Crunches - 3 sets of 15")
                fridayPlan.append("Leg raises - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute Jog")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute Jog")
                completePlan()
                return workoutArray
            }
                // GAIN STRENGTH AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Strength")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 6 sets of 10")
                mondayPlan.append("Tricep Dips - 6 Sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Pull ups - 5 sets of 10")
                wednesdayPlan.append("Chinups - 5 sets of 10")
                wednesdayPlan.append("20 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squat jumps - 4 sets of 10")
                fridayPlan.append("Lunges - 4 sets of 10")
                fridayPlan.append("Leg raises - 4 sets of 10")
                fridayPlan.append("Crunches - 4 sets of 10")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute jog")
                sundayPlan.append("Sprints")
                sundayPlan.append("10 minute jog warmup")
                sundayPlan.append("10 minute Hamstring and Quad Stretch")
                sundayPlan.append("6 sets of 100 meter sprints")
                completePlan()
                return workoutArray
            }
            return workoutArray
        // Great than 6 Hours
        case "> 6 hours":
            // LOSE WEIGHT AND GAIN MUSCLE
            if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Muscle") || (user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout & Cardio")
                mondayPlan.append("Close palm pushups - 6 Sets of 10-12")
                mondayPlan.append("Standard pushups - 6 sets of 10-12")
                mondayPlan.append("Tricep Dips - 8 Sets of 10-12")
                mondayPlan.append("20 minutes jog")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Close grip chin ups - 5 sets of 10-12")
                wednesdayPlan.append("Wide grip pull ups - 5 sets of 10-12")
                wednesdayPlan.append("Close grip pull ups - 5 sets of 10-12")
                wednesdayPlan.append("20 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute Jog")
                fridayPlan.append("Legs and Abs Workout & Cardio")
                fridayPlan.append("Lunges - 6 Sets of 10-12")
                fridayPlan.append("Squat jumps - 6 sets of 10-12")
                fridayPlan.append("Crunches - 6 sets of 15")
                fridayPlan.append("Leg raises - 6 sets of 15")
                fridayPlan.append("20 minute jog")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute Jog")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute Jog")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND GAIN STRENGTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 6 sets of 10")
                mondayPlan.append("Tricep Dips - 6 Sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("30 minute jog")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Pull ups - 5 sets of 10")
                wednesdayPlan.append("Chinups - 5 sets of 10")
                wednesdayPlan.append("30 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("30 minute jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squat jumps - 4 sets of 10")
                fridayPlan.append("Lunges - 4 sets of 10")
                fridayPlan.append("Leg raises - 4 sets of 10")
                fridayPlan.append("Crunches - 4 sets of 10")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("30 minute jog")
                sundayPlan.append("Sprints")
                sundayPlan.append("10 minute jog warmup")
                sundayPlan.append("10 minute Hamstring and Quad Stretch")
                sundayPlan.append("6 sets of 100 meter sprints")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Lose Weight")) {
                mondayPlan.append("Cardio")
                mondayPlan.append("40 minute jog")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("40 minute jog")
                wednesdayPlan.append("Cardio")
                wednesdayPlan.append("40 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("40 minute jog")
                fridayPlan.append("Cardio")
                fridayPlan.append("40 minute jog")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("40 minute jog")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND GAIN STRENGTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Close palm pushups - 6 Sets of 10-12")
                mondayPlan.append("Standard pushups - 6 sets of 10-12")
                mondayPlan.append("Tricep Dips - 8 Sets of 10-12")
                tuesdayPlan.append("Rest")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Close grip chin ups - 5 sets of 10-12")
                wednesdayPlan.append("Wide grip pull ups - 5 sets of 10-12")
                wednesdayPlan.append("Close grip pull ups - 5 sets of 10-12")
                thursdayPlan.append("Rest")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Lunges - 6 Sets of 10-12")
                fridayPlan.append("Squat jumps - 6 sets of 10-12")
                fridayPlan.append("Crunches - 6 sets of 15")
                fridayPlan.append("Leg raises - 6 sets of 15")
                saturdayPlan.append("Rest")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout & Cardio")
                mondayPlan.append("Close palm pushups - 6 Sets of 10-12")
                mondayPlan.append("Standard pushups - 6 sets of 10-12")
                mondayPlan.append("Tricep Dips - 8 Sets of 10-12")
                mondayPlan.append("20 minutes jog")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute jog")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Close grip chin ups - 5 sets of 10-12")
                wednesdayPlan.append("Wide grip pull ups - 5 sets of 10-12")
                wednesdayPlan.append("Close grip pull ups - 5 sets of 10-12")
                wednesdayPlan.append("20 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute Jog")
                fridayPlan.append("Legs and Abs Workout & Cardio")
                fridayPlan.append("Lunges - 6 Sets of 10-12")
                fridayPlan.append("Squat jumps - 6 sets of 10-12")
                fridayPlan.append("Crunches - 6 sets of 15")
                fridayPlan.append("Leg raises - 6 sets of 15")
                fridayPlan.append("20 minute jog")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute Jog")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute Jog")
                completePlan()
                return workoutArray
            }
                // GAIN STRENGTH AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Strength")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Pushups - 6 sets of 10")
                mondayPlan.append("Tricep Dips - 6 Sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("30 minute jog")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Pull ups - 5 sets of 10")
                wednesdayPlan.append("Chinups - 5 sets of 10")
                wednesdayPlan.append("30 minute jog")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("30 minute jog")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squat jumps - 4 sets of 10")
                fridayPlan.append("Lunges - 4 sets of 10")
                fridayPlan.append("Leg raises - 4 sets of 10")
                fridayPlan.append("Crunches - 4 sets of 10")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("30 minute jog")
                sundayPlan.append("Sprints")
                sundayPlan.append("10 minute jog warmup")
                sundayPlan.append("10 minute Hamstring and Quad Stretch")
                sundayPlan.append("6 sets of 100 meter sprints")
                completePlan()
                return workoutArray
            }
            return workoutArray
        default:
            return workoutArray
        }
    }
    
    /*
     :parm: user: UserInfo - contains the user information
     :returns: The custom workout plan for a user who does have gym access
     */
    func generateGymWorkoutPlan(_ user: UserInfo) -> [[String]] {
        switch user.hours! {
        // 1-2 Hours
        case "1-2 hours":
            // LOSE WEIGHT AND GAIN MUSCLE
            if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Muscle") || (user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Dumbbell press - 3 sets of 10-12")
                mondayPlan.append("Dumbbell kickbacks - 3 sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull workout")
                wednesdayPlan.append("Lat pulldowns - 3 sets of 10-12")
                wednesdayPlan.append("Bicep curls - 3 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Leg press - 3 sets of 10-12")
                fridayPlan.append("Leg curls - 3 sets of 10-12")
                fridayPlan.append("Crunches - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute jog")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND GAIN STRENGTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Bench press - 6 sets of 8")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Barbell rows - 3 sets of 8")
                wednesdayPlan.append("Deadlifts - 3 sets of 8")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 8")
                fridayPlan.append("Crunches - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Lose Weight")) {
                mondayPlan.append("Cardio")
                mondayPlan.append("20 minute indoor cycle")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Cardio")
                wednesdayPlan.append("20 minute indoor cycle")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute treadmill")
                fridayPlan.append("Cardio")
                fridayPlan.append("20 minute indoor cycle")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND GAIN STRENGTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Bench press - 6 sets of 8")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Barbell rows - 3 sets of 8")
                wednesdayPlan.append("Deadlifts - 3 sets of 8")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 8")
                fridayPlan.append("Crunches - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Dumbbell press - 3 sets of 10-12")
                mondayPlan.append("Dumbbell kickbacks - 3 sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull workout")
                wednesdayPlan.append("Lat pulldowns - 3 sets of 10-12")
                wednesdayPlan.append("Bicep curls - 3 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Leg press - 3 sets of 10-12")
                fridayPlan.append("Leg curls - 3 sets of 10-12")
                fridayPlan.append("Crunches - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute jog")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN STRENGTH AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Strength")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Bench press - 6 sets of 8")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Barbell rows - 3 sets of 8")
                wednesdayPlan.append("Deadlifts - 3 sets of 8")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 8")
                fridayPlan.append("Crunches - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
            return workoutArray
        // 2-4 Hours
        case "2-4 hours":
            // LOSE WEIGHT AND GAIN MUSCLE
            if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Muscle") || (user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Dumbbell press - 3 sets of 10-12")
                mondayPlan.append("Dumbbell kickbacks - 3 sets of 10-12")
                mondayPlan.append("Chest flys - 3 sets of 12")
                mondayPlan.append("Tricep pulldowns - 3 sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull workout")
                wednesdayPlan.append("Lat pulldowns - 3 sets of 10-12")
                wednesdayPlan.append("Bicep curls - 3 sets of 10-12")
                wednesdayPlan.append("Chinups - 3 sets of 10-12")
                wednesdayPlan.append("Dumbbell rows: 3 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Leg press - 3 sets of 10-12")
                fridayPlan.append("Leg curls - 3 sets of 10-12")
                fridayPlan.append("Squats - 3 sets of 10-12")
                fridayPlan.append("Crunches - 3 sets of 15")
                fridayPlan.append("Leg raises - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND GAIN STRENGTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Bench press - 6 sets of 8")
                mondayPlan.append("Pushups - 4 sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Barbell rows - 3 sets of 8")
                wednesdayPlan.append("Deadlifts - 3 sets of 8")
                wednesdayPlan.append("Pullups - 3 sets of 8")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 8")
                fridayPlan.append("Squat jumps - 3 sets of 10")
                fridayPlan.append("Crunches - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Lose Weight")) {
                mondayPlan.append("Cardio")
                mondayPlan.append("30 minute indoor cycle")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("30 minute treadmill")
                wednesdayPlan.append("Cardio")
                wednesdayPlan.append("30 minute indoor cycle")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("30 minute treadmill")
                fridayPlan.append("Cardio")
                fridayPlan.append("30 minute indoor cycle")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("30 minute treadmill")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND GAIN STRENGTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Bench press - 6 sets of 10")
                mondayPlan.append("Pushups - 3 sets of 10")
                tuesdayPlan.append("Rest")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Barbell rows - 3 sets of 10")
                wednesdayPlan.append("Deadlifts - 3 sets of 8")
                wednesdayPlan.append("Pullups - 3 sets of 10")
                thursdayPlan.append("Rest")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 10")
                fridayPlan.append("Leg press - 3 sets of 10")
                fridayPlan.append("Crunches - 3 sets of 15")
                fridayPlan.append("Leg raises - 3 sets of 15")
                saturdayPlan.append("Rest")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Dumbbell press - 3 sets of 10-12")
                mondayPlan.append("Dumbbell kickbacks - 3 sets of 10-12")
                mondayPlan.append("Chest flys - 3 sets of 12")
                mondayPlan.append("Tricep pulldowns - 3 sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull workout")
                wednesdayPlan.append("Lat pulldowns - 3 sets of 10-12")
                wednesdayPlan.append("Bicep curls - 3 sets of 10-12")
                wednesdayPlan.append("Chinups - 3 sets of 10-12")
                wednesdayPlan.append("Dumbbell rows: 3 sets of 10-12")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Leg press - 3 sets of 10-12")
                fridayPlan.append("Leg curls - 3 sets of 10-12")
                fridayPlan.append("Squats - 3 sets of 10-12")
                fridayPlan.append("Crunches - 3 sets of 15")
                fridayPlan.append("Leg raises - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN STRENGTH AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Strength")){
                mondayPlan.append("Push Workout")
                mondayPlan.append("Bench press - 6 sets of 8")
                mondayPlan.append("Pushups - 4 sets of 10")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull Workout")
                wednesdayPlan.append("Barbell rows - 3 sets of 8")
                wednesdayPlan.append("Deadlifts - 3 sets of 8")
                wednesdayPlan.append("Pullups - 3 sets of 8")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 8")
                fridayPlan.append("Squat jumps - 3 sets of 10")
                fridayPlan.append("Crunches - 3 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
            return workoutArray
        // 4-6 Hours
        case "4-6 hours":
            // LOSE WEIGHT AND GAIN MUSCLE
            if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Muscle") || (user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Chest/Triceps Workout")
                mondayPlan.append("Dumbbell press - 3 sets of 10-12")
                mondayPlan.append("Dumbbell kickbacks - 3 sets of 10-12")
                mondayPlan.append("Chest flys - 3 sets of 10-12")
                mondayPlan.append("Tricep pulldowns - 3 sets of 10-12")
                mondayPlan.append("Tricep Dips - 3 sets of 10-12")
                mondayPlan.append("Seated chest machine press - 3 sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Back/Biceps workout & Cardio")
                wednesdayPlan.append("Barbell rows - 3 sets of 10-12")
                wednesdayPlan.append("Chinups - 3 sets of 10-12")
                wednesdayPlan.append("Dumbbell rows: 3 sets of 10-12")
                wednesdayPlan.append("Bicep curls - 3 sets of 10-12")
                wednesdayPlan.append("Hammer curls - 3 sets of 10-12")
                wednesdayPlan.append("Pullups - 3 sets of 10-12")
                wednesdayPlan.append("15 minute indoor cycling")
                thursdayPlan.append("Legs and Abs Workout")
                thursdayPlan.append("Leg press - 3 sets of 10-12")
                thursdayPlan.append("Leg curls - 3 sets of 10-12")
                thursdayPlan.append("Squats - 3 sets of 10-12")
                thursdayPlan.append("Crunches - 3 sets of 15")
                thursdayPlan.append("Leg raises - 3 sets of 15")
                fridayPlan.append("Shoulders and Traps Workout")
                fridayPlan.append("Shoulder press - 3 sets of 10-12")
                fridayPlan.append("Shrugs - 3 sets of 10-12")
                fridayPlan.append("Reverse flys - 3 sets of 10-12")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND GAIN STRENGTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout & Cardio")
                mondayPlan.append("Bench press - 6 sets of 8")
                mondayPlan.append("Pushups - 4 sets of 10")
                mondayPlan.append("Tricep Dips - 3 sets of 10")
                mondayPlan.append("20 minute treadmill")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Barbell rows - 4 sets of 8")
                wednesdayPlan.append("Deadlifts - 4 sets of 8")
                wednesdayPlan.append("Pullups - 4 sets of 8")
                wednesdayPlan.append("20 minutes indoor cycling")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 8")
                fridayPlan.append("Squat jumps - 5 sets of 10")
                fridayPlan.append("Crunches - 5 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Lose Weight")) {
                mondayPlan.append("Cardio")
                mondayPlan.append("40 minute indoor cycle")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("40 minute treadmill")
                wednesdayPlan.append("Cardio")
                wednesdayPlan.append("40 minute indoor cycle")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("40 minute treadmill")
                fridayPlan.append("Cardio")
                fridayPlan.append("40 minute indoor cycle")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("40 minute treadmill")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND GAIN STRENGTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Chest and Triceps Workout")
                mondayPlan.append("Bench press - 6 sets of 10")
                mondayPlan.append("Pushups - 3 sets of 10")
                mondayPlan.append("Tricep pulldowns - 3 sets of 10")
                mondayPlan.append("Tricep Dips - 3 sets of 10")
                tuesdayPlan.append("Rest")
                wednesdayPlan.append("Back and Biceps Workout")
                wednesdayPlan.append("Barbell rows - 3 sets of 10")
                wednesdayPlan.append("Deadlifts - 3 sets of 8")
                wednesdayPlan.append("Pullups - 3 sets of 10")
                wednesdayPlan.append("Bicep curls - 3 sets of 10")
                wednesdayPlan.append("Hammer curls - 3 sets of 10")
                thursdayPlan.append("Rest")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 10")
                fridayPlan.append("Leg press - 3 sets of 10")
                fridayPlan.append("Leg curls - 3 sets of 10")
                fridayPlan.append("Crunches - 3 sets of 15")
                fridayPlan.append("Leg raises - 3 sets of 15")
                saturdayPlan.append("Shoulders and Traps Workout")
                saturdayPlan.append("Shoulder press - 3 sets of 10")
                saturdayPlan.append("Shrugs - 3 sets of 10")
                saturdayPlan.append("Reverse flys - 3 sets of 10")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Chest/Triceps Workout")
                mondayPlan.append("Dumbbell press - 3 sets of 10-12")
                mondayPlan.append("Dumbbell kickbacks - 3 sets of 10-12")
                mondayPlan.append("Chest flys - 3 sets of 10-12")
                mondayPlan.append("Tricep pulldowns - 3 sets of 10-12")
                mondayPlan.append("Tricep Dips - 3 sets of 10-12")
                mondayPlan.append("Seated chest machine press - 3 sets of 10-12")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Back/Biceps workout & Cardio")
                wednesdayPlan.append("Barbell rows - 3 sets of 10-12")
                wednesdayPlan.append("Chinups - 3 sets of 10-12")
                wednesdayPlan.append("Dumbbell rows: 3 sets of 10-12")
                wednesdayPlan.append("Bicep curls - 3 sets of 10-12")
                wednesdayPlan.append("Hammer curls - 3 sets of 10-12")
                wednesdayPlan.append("Pullups - 3 sets of 10-12")
                wednesdayPlan.append("15 minute indoor cycling")
                thursdayPlan.append("Legs and Abs Workout")
                thursdayPlan.append("Leg press - 3 sets of 10-12")
                thursdayPlan.append("Leg curls - 3 sets of 10-12")
                thursdayPlan.append("Squats - 3 sets of 10-12")
                thursdayPlan.append("Crunches - 3 sets of 15")
                thursdayPlan.append("Leg raises - 3 sets of 15")
                fridayPlan.append("Shoulders and Traps Workout")
                fridayPlan.append("Shoulder press - 3 sets of 10-12")
                fridayPlan.append("Shrugs - 3 sets of 10-12")
                fridayPlan.append("Reverse flys - 3 sets of 10-12")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
                // GAIN STRENGTH AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Strength")){
                mondayPlan.append("Push Workout & Cardio")
                mondayPlan.append("Bench press - 6 sets of 8")
                mondayPlan.append("Pushups - 4 sets of 10")
                mondayPlan.append("Tricep Dips - 3 sets of 10")
                mondayPlan.append("20 minute treadmill")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Barbell rows - 4 sets of 8")
                wednesdayPlan.append("Deadlifts - 4 sets of 8")
                wednesdayPlan.append("Pullups - 4 sets of 8")
                wednesdayPlan.append("20 minutes indoor cycling")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 8")
                fridayPlan.append("Squat jumps - 5 sets of 10")
                fridayPlan.append("Crunches - 5 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
            return workoutArray
        // Great than 6 Hours
        case "> 6 hours":
            // LOSE WEIGHT AND GAIN MUSCLE
            if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Muscle") || (user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Chest Workout & Cardio")
                mondayPlan.append("Dumbbell press - 3 sets of 10-12")
                mondayPlan.append("Chest flys - 3 sets of 10-12")
                mondayPlan.append("Seated chest machine press - 3 sets of 10-12")
                mondayPlan.append("Bench press - 3 sets of 10-12")
                mondayPlan.append("Inclined Dumbbell press")
                mondayPlan.append("20 minute treadmill")
                tuesdayPlan.append("Back workout & Cardio")
                tuesdayPlan.append("Barbell rows - 3 sets of 10-12")
                tuesdayPlan.append("Lat pulldowns - 3 sets of 10-12")
                tuesdayPlan.append("Dumbbell rows: 3 sets of 10-12")
                tuesdayPlan.append("Pullups - 3 sets of 10-12")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Legs Workout & Cardio")
                wednesdayPlan.append("Leg press - 3 sets of 10-12")
                wednesdayPlan.append("Leg curls - 3 sets of 10-12")
                wednesdayPlan.append("Calf raises - 3 sets of 10-12")
                wednesdayPlan.append("Squats - 3 sets of 10-12")
                wednesdayPlan.append("20 minute indoor cycling")
                thursdayPlan.append("Shoulders/Traps Workout & Cardio")
                thursdayPlan.append("Shoulder press - 3 sets of 10-12")
                thursdayPlan.append("Shrugs - 3 sets of 10-12")
                thursdayPlan.append("Reverse flys - 3 sets of 10-12")
                thursdayPlan.append("Shoulder raises - 3 sets of 10-12")
                thursdayPlan.append("20 minute treadmill")
                fridayPlan.append("Triceps Workout & Cardio")
                fridayPlan.append("Dumbbell kickbacks - 3 sets of 10-12")
                fridayPlan.append("Tricep pulldowns - 3 sets of 10-12")
                fridayPlan.append("Tricep Dips - 3 sets of 10-12")
                saturdayPlan.append("Biceps Workout & Cardio")
                saturdayPlan.append("Chinups - 3 sets of 10-12")
                saturdayPlan.append("Bicep curls - 3 sets of 10-12")
                saturdayPlan.append("Hammer curls - 3 sets of 10-12")
                saturdayPlan.append("Barbell curls - 3 sets of 10-12")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Abs Workout & Cardio")
                sundayPlan.append("Crunches - 5 sets of 15")
                sundayPlan.append("Leg raises - 5 sets of 15")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND GAIN STRENGTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Lose Weight")){
                mondayPlan.append("Push Workout & Cardio")
                mondayPlan.append("Bench press - 6 sets of 8")
                mondayPlan.append("Pushups - 6 sets of 10")
                mondayPlan.append("Tricep Dips - 4 sets of 10")
                mondayPlan.append("20 minute treadmill")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Barbell rows - 5 sets of 8")
                wednesdayPlan.append("Deadlifts - 5 sets of 8")
                wednesdayPlan.append("Pullups - 5 sets of 8")
                wednesdayPlan.append("20 minutes indoor cycling")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 8")
                fridayPlan.append("Squat jumps - 5 sets of 10")
                fridayPlan.append("Crunches - 5 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
                // LOSE WEIGHT AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Lose Weight" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Lose Weight")) {
                mondayPlan.append("Cardio")
                mondayPlan.append("40 minute indoor cycle")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("40 minute treadmill")
                wednesdayPlan.append("Cardio")
                wednesdayPlan.append("40 minute indoor cycle")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("40 minute treadmill")
                fridayPlan.append("Cardio")
                fridayPlan.append("40 minute indoor cycle")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("40 minute treadmill")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND GAIN STRENGTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Gain Strength") || (user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Chest and Triceps Workout")
                mondayPlan.append("Bench press - 6 sets of 10")
                mondayPlan.append("Pushups - 4 sets of 10")
                mondayPlan.append("Tricep pulldowns - 4 sets of 10")
                mondayPlan.append("Tricep Dips - 4 sets of 10")
                tuesdayPlan.append("Rest")
                wednesdayPlan.append("Back and Biceps Workout")
                wednesdayPlan.append("Barbell rows - 4 sets of 10")
                wednesdayPlan.append("Deadlifts - 4 sets of 8")
                wednesdayPlan.append("Pullups - 4 sets of 10")
                wednesdayPlan.append("Bicep curls - 3 sets of 10")
                wednesdayPlan.append("Hammer curls - 3 sets of 10")
                thursdayPlan.append("Rest")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 10")
                fridayPlan.append("Leg press - 4 sets of 10")
                fridayPlan.append("Leg curls - 4 sets of 10")
                fridayPlan.append("Crunches - 4 sets of 15")
                fridayPlan.append("Leg raises - 4 sets of 15")
                saturdayPlan.append("Shoulders and Traps Workout")
                saturdayPlan.append("Shoulder press - 4 sets of 10")
                saturdayPlan.append("Shrugs - 4 sets of 10")
                saturdayPlan.append("Reverse flys - 4 sets of 10")
                sundayPlan.append("Rest")
                completePlan()
                return workoutArray
            }
                // GAIN MUSCLE AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Muscle" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Muscle")){
                mondayPlan.append("Chest Workout & Cardio")
                mondayPlan.append("Dumbbell press - 3 sets of 10-12")
                mondayPlan.append("Chest flys - 3 sets of 10-12")
                mondayPlan.append("Seated chest machine press - 3 sets of 10-12")
                mondayPlan.append("Bench press - 3 sets of 10-12")
                mondayPlan.append("Inclined Dumbbell press")
                mondayPlan.append("20 minute treadmill")
                tuesdayPlan.append("Back workout & Cardio")
                tuesdayPlan.append("Barbell rows - 3 sets of 10-12")
                tuesdayPlan.append("Lat pulldowns - 3 sets of 10-12")
                tuesdayPlan.append("Dumbbell rows: 3 sets of 10-12")
                tuesdayPlan.append("Pullups - 3 sets of 10-12")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Legs Workout & Cardio")
                wednesdayPlan.append("Leg press - 3 sets of 10-12")
                wednesdayPlan.append("Leg curls - 3 sets of 10-12")
                wednesdayPlan.append("Calf raises - 3 sets of 10-12")
                wednesdayPlan.append("Squats - 3 sets of 10-12")
                wednesdayPlan.append("20 minute indoor cycling")
                thursdayPlan.append("Shoulders/Traps Workout & Cardio")
                thursdayPlan.append("Shoulder press - 3 sets of 10-12")
                thursdayPlan.append("Shrugs - 3 sets of 10-12")
                thursdayPlan.append("Reverse flys - 3 sets of 10-12")
                thursdayPlan.append("Shoulder raises - 3 sets of 10-12")
                thursdayPlan.append("20 minute treadmill")
                fridayPlan.append("Triceps Workout & Cardio")
                fridayPlan.append("Dumbbell kickbacks - 3 sets of 10-12")
                fridayPlan.append("Tricep pulldowns - 3 sets of 10-12")
                fridayPlan.append("Tricep Dips - 3 sets of 10-12")
                saturdayPlan.append("Biceps Workout & Cardio")
                saturdayPlan.append("Chinups - 3 sets of 10-12")
                saturdayPlan.append("Bicep curls - 3 sets of 10-12")
                saturdayPlan.append("Hammer curls - 3 sets of 10-12")
                saturdayPlan.append("Barbell curls - 3 sets of 10-12")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Abs Workout & Cardio")
                sundayPlan.append("Crunches - 5 sets of 15")
                sundayPlan.append("Leg raises - 5 sets of 15")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
                // GAIN STRENGTH AND IMPROVE HEALTH
            else if((user.primaryGoal! == "Gain Strength" && user.secondaryGoal! == "Improve Health") || (user.primaryGoal! == "Improve Health" && user.secondaryGoal! == "Gain Strength")){
                mondayPlan.append("Push Workout & Cardio")
                mondayPlan.append("Bench press - 6 sets of 8")
                mondayPlan.append("Pushups - 6 sets of 10")
                mondayPlan.append("Tricep Dips - 4 sets of 10")
                mondayPlan.append("20 minute treadmill")
                tuesdayPlan.append("Cardio")
                tuesdayPlan.append("20 minute treadmill")
                wednesdayPlan.append("Pull Workout & Cardio")
                wednesdayPlan.append("Barbell rows - 5 sets of 8")
                wednesdayPlan.append("Deadlifts - 5 sets of 8")
                wednesdayPlan.append("Pullups - 5 sets of 8")
                wednesdayPlan.append("20 minutes indoor cycling")
                thursdayPlan.append("Cardio")
                thursdayPlan.append("20 minute indoor cycling")
                fridayPlan.append("Legs and Abs Workout")
                fridayPlan.append("Squats - 5 sets of 8")
                fridayPlan.append("Squat jumps - 5 sets of 10")
                fridayPlan.append("Crunches - 5 sets of 15")
                saturdayPlan.append("Cardio")
                saturdayPlan.append("20 minute treadmill")
                sundayPlan.append("Cardio")
                sundayPlan.append("20 minute indoor cycling")
                completePlan()
                return workoutArray
            }
            return workoutArray
        default:
            return workoutArray
        }
    }
}

