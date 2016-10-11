//
//  MealViewController.swift
//  JDFitness
//
//  Created by Jonathan Deehan on 08/10/2016.
//  Copyright © 2016 jdblogs. All rights reserved.
//

import Foundation
import UIKit

class MealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var mealTableData:[[String]] = []
    let mealOne:[String] = ["2 wheat biscuits (47g), 1.5 (360ml)cups nonfat milk, 1 Orange", "365 calories, 3% calories from fat, 19.5g protein, 7.7g fiber"]
    let mealTwo:[String] = ["1/2 cup (40g) dry oatmeal), 1.5 (360ml)cups nonfat milk, 1 apple", "315 calories, 6% calories from fat, 19.5g protein, 5.7g fiber"]
    let mealThree:[String] = ["2 2/3 cups (380g) mixed vegetables, 1/2 can (70g) boneless skinless salmon", "310 calories, 3% cals from fat, 28g protein, 12g fiber"]
    let mealFour:[String] = ["25g whey protein, 1 cup orange juice, 1 frozen banana", "315 calories, 3% cals from fat, 27g protein, 2g fiber"]
    let mealFive:[String] = ["3 1/2 cup oats, 25g whey protein","260 calories, 10% cals from fat, 30g protein, 4g fiber"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let meal = mealTableData[indexPath.section]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12.0)
        cell.textLabel?.sizeToFit()
        cell.textLabel?.text = meal[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let meal = mealTableData[section]
        return meal.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        mealTableData.append(mealOne);
        mealTableData.append(mealTwo);
        mealTableData.append(mealThree);
        mealTableData.append(mealFour);
        mealTableData.append(mealFive);
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Meal One"
        case 1:
            return "Meal Two"
        case 2:
            return "Meal Three"
        case 3:
            return "Meal Four"
        case 4:
            return "Meal Five"
        default:
            return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
