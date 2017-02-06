//
//  ResultsViewController.swift
//  JDFitness
//
//  Created by Jonathan Deehan on 28/09/2016.
//  Copyright © 2016 jdblogs. All rights reserved.
//

import Foundation
import UIKit
import HealthKit
import HealthKitUI
import Charts

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var barView: BarChartView!

    // Array for data to populate the table of results
    var resultsTableData:[[String]] = []
    
    // Array to store running workout data
    var runningWorkoutData: [String] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let workoutResult = resultsTableData[indexPath.section]
        cell.textLabel?.text = workoutResult[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return resultsTableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let workoutResult = resultsTableData[section]
        return workoutResult.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Workout \(section + 1)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Disable chart legend
        barView.legend.enabled = false
        
        // Diable zoom in function on graph
        barView.scaleYEnabled = false
        barView.scaleXEnabled = false
        barView.pinchZoomEnabled = false
        barView.doubleTapToZoomEnabled = false
        
        // Enable chart animation
        barView.animate(yAxisDuration: 1.5, easingOption: .easeInOutQuart)

        // Chart description
        barView.descriptionText = "Running Times"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
        // Check if the HealthKit Data is available
        if HKHealthStore.isHealthDataAvailable() {
            // HealthKit is available. Use at will.
            let healthStore = HKHealthStore()
            let writeTypes: Set<HKSampleType> = Set([ HKObjectType.workoutType() ])
            let readTypes: Set<HKObjectType> = Set([ HKObjectType.workoutType() ])
            // Request authorization from the user to read and write data to the HealthKit app
            healthStore.requestAuthorization(toShare: writeTypes, read: readTypes) { (success, error) -> Void in
                if let error = error, !success {
                    NSLog("Display not allowed")
                }
            }
            var predicate = HKQuery.predicateForWorkouts(with: HKWorkoutActivityType.running)
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            let sampleQuery = HKSampleQuery(sampleType: HKWorkoutType.workoutType(), predicate: predicate, limit: 0, sortDescriptors: [sortDescriptor])
            { (sampleQuery, results, error ) -> Void in
                
                if let queryError = error {
                    print( "There was an error while reading the samples: \(queryError.localizedDescription)")
                }
                else
                {
                    let date = Date()
                    let startIndex = date.description.index(date.description.startIndex, offsetBy: 0)
                    let endIndex = date.description.index(date.description.startIndex, offsetBy: 9)
                    let currentDate:String = date.description[startIndex...endIndex]
                    // For testing
                    print("Day of the Week: \(currentDate)")
                    
                    // Cycle through each of the workout results read from HealthKit
                    for samples: HKSample in results! {
                        var workout: HKWorkout = (samples as! HKWorkout)
                        
                        let startIndex = samples.startDate.description.index(samples.startDate.description.startIndex, offsetBy: 0)
                        let endIndex = samples.startDate.description.index(samples.startDate.description.startIndex, offsetBy: 9)
                        let durationInMinutes = Int(workout.duration/60)
                        var workoutData = ["Date: \(samples.startDate.description[startIndex...endIndex])", "Total Distance: \(workout.totalDistance!)", "Energy Burned: \(workout.totalEnergyBurned!)","Total Duration: \(durationInMinutes.description) minutes"]
                        
                        // Save running workout duration
                        let runningWorkout = durationInMinutes.description
                        
                        // Generate the running data to json format and save locally
                        self.runningWorkoutData.append(runningWorkout)
                        
                        // Add the workout to the results table
                        self.resultsTableData.append(workoutData)
                    }
                    // Plot Results
                    self.plotResults()

                }
            }
            healthStore.execute(sampleQuery)
        }
    }
    
    func plotResults(){
        var dataEntries: [BarChartDataEntry] = []
        
        let resultsData = self.resultsTableData
        var xCor = 1
        
        for value in resultsData {
            print(value)
            // Start and end index of the string to fetch the running time in minutes
            let startIndex = value[3].index(value[3].startIndex, offsetBy: 16)
            let endIndex = value[3].index(value[3].endIndex, offsetBy: -8)

            let minutes = value[3].substring(with: startIndex..<endIndex)
            
            let dataEntry = BarChartDataEntry(x: Double(xCor), y: Double(minutes)!)
            dataEntries.append(dataEntry)
            xCor+=1
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "WorkoutData")
        let chartData = BarChartData(dataSet: chartDataSet)
        barView.data = chartData
        
        let xaxis = barView.xAxis

    }

    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

}
