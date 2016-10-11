//
//  UserInfoViewController.swift
//  JDFitness
//
//  Created by Jonathan Deehan on 04/10/2016.
//  Copyright © 2016 jdblogs. All rights reserved.
//

import Foundation
import UIKit

class UserInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var userInfoArray: [UserInfo] = []
    var userInfoTableList: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoTableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = userInfoTableList[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    // Get the data from UserInfo model [core data]
    func getData() {
        if #available(iOS 10.0, *) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                userInfoArray = try context.fetch(UserInfo.fetchRequest())
                // Currently using a hack to force the information to show the latest change to the UserInfo model [userInfoArray[userInfoArray.count-1]
                userInfoTableList.append("Age: " + userInfoArray[userInfoArray.count-1].age!)
                userInfoTableList.append("Weight: " + userInfoArray[userInfoArray.count-1].weight! + " kg")
                userInfoTableList.append("Height: " + userInfoArray[userInfoArray.count-1].height!)
                userInfoTableList.append("Primary Goal: " + userInfoArray[userInfoArray.count-1].primaryGoal!)
                userInfoTableList.append("Secondary Goal: " + userInfoArray[userInfoArray.count-1].secondaryGoal!)
                userInfoTableList.append("Gym Access: " + userInfoArray[userInfoArray.count-1].gymAccess!)
                userInfoTableList.append("Hours per week: " + userInfoArray[userInfoArray.count-1].hours!)
            }
            catch {
                print("Fetching Failed")
            }

        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Get the data from core data
        getData()
    }
    
}
