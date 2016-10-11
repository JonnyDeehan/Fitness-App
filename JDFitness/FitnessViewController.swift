//
//  FitnessViewController.swift
//  JDFitness
//
//  Created by Jonathan Deehan on 28/09/2016.
//  Copyright © 2016 jdblogs. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// This class displays the custom workout generated in a tableview format
class FitnessViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // User Info from core data
    var userInfoArray: [UserInfo] = []
    
    // Array containing the workout plan for each day of the week
    var workoutArray: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Returns the numner of rows in each particular section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let workout = workoutArray[section]
        
        return workout.count
    }
    
    // Returns the cell contents
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let workout = workoutArray[indexPath.section]
        cell.textLabel?.text = workout[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    // Sections are split by the day of the week
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Monday"
        case 1:
            return "Tuesday"
        case 2:
            return "Wednesday"
        case 3:
            return "Thursday"
        case 4:
            return "Friday"
        case 5:
            return "Saturday"
        case 6:
            return "Sunday"
        default:
            return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func getData() {
        if #available(iOS 10.0, *) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                // Get the UserInfo data [in core data]
                userInfoArray = try context.fetch(UserInfo.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
            
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        var customWorkout = Fitness()
        // Generate the custom workout based on the received data from getData() [core data]
        workoutArray = customWorkout.determineUserAnswers(userInfoArray[userInfoArray.count-1])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
