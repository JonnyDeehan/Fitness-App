//
//  UserViewController.swift
//  JDFitness
//
//  Created by Jonathan Deehan on 28/09/2016.
//  Copyright © 2016 jdblogs. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UserViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIViewControllerTransitioningDelegate {
    
    // Height options in (ft)
    let height = ["<5'0","5'1","5'2","5'3","5'4","5'5","5'6","5'7","5'8","5'9","5'10","5'11","6'0","6'1","6'2","6'3","6'4","6'5"," >6'5"]
    
    // User goal options
    let goal = ["Lose Weight", "Gain Muscle", "Gain Strength", "Improve Health"]
    
    // Does the user have gym access
    let gymAccess = ["Yes", "No"]
    
    // Number of hours per week a user can commit to working out
    let hoursPerWeek = ["1-2 hours", "2-4 hours", "4-6 hours", "> 6 hours"]
    
    var heightPickerView = UIPickerView()
    var primaryGoalPickerView = UIPickerView()
    var secondaryGoalPickerView = UIPickerView()
    var gymAccessPickerView = UIPickerView()
    var hoursPickerView = UIPickerView()
    
    @IBOutlet weak var userTitleLabel: UILabel!
    
    @IBAction func proceedButton(_ sender: UIButton) {
        // Check for missing fields
        // Populate the user class with the information
        // Go to next view controller
        
        if heightTextField.text! == "" || primaryGoalTextField.text! == "" || secondaryGoalTextField.text! == "" || gymAccessTextField.text! == "" || hoursTextField.text! == "" || ageTextField.text! == "" || weightTextField.text! == "" {
            let alert:UIAlertController = UIAlertController(title: "Missing Fields", message: "Please fill in all fields", preferredStyle: UIAlertControllerStyle.alert)
            let action:UIAlertAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: {(a: UIAlertAction) -> Void in print("item selected")})
            alert.addAction(action)
            self.present(alert, animated: true, completion: { () -> Void in print("alert presented")})
            
        }
        else {
            var hasGymAccess: String = "Does not have gym access"
            if gymAccessTextField.text == "Yes" {
                hasGymAccess = "Has access to a gym"
            }
            var user = User(weight: weightTextField.text!, height: heightTextField.text!, age: ageTextField.text!, primaryGoal: primaryGoalTextField.text!, secondaryGoal: secondaryGoalTextField.text!, gymAccess: hasGymAccess, hours: hoursTextField.text!)
            
            // Save the user info

            if #available(iOS 10.0, *) {
                // Always need this line when working with core data
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                
                let userInfo = UserInfo(context: context)
                
                // Set Values for new UserInfo
                userInfo.age = user.getAge()
                userInfo.gymAccess = user.getGymAccess()
                userInfo.height = user.getHeight()
                userInfo.weight = user.getWeight()
                userInfo.primaryGoal = user.getPrimaryGoal()
                userInfo.secondaryGoal = user.getSecondaryGoal()
                userInfo.hours = user.getWeeklyHours()
                
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                
            } else {
                // Fallback on earlier versions
            }
            // Ensure the user can't return back to the main menu during intial first time use
            // (have to ensure user inputs information first)
            navigationController?.navigationBar.isUserInteractionEnabled = true
            navigationController?.isNavigationBarHidden = false
            navigationController?.popViewController(animated: true)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == heightPickerView {
            return height.count
        }
        else if pickerView == primaryGoalPickerView {
            return goal.count
        }
        else if pickerView == secondaryGoalPickerView {
            return goal.count
        }
        else if pickerView == gymAccessPickerView {
            return gymAccess.count
        }
        else if pickerView == hoursPickerView{
            return hoursPerWeek.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == heightPickerView {
            heightTextField.text = height[row]
        }
        else if pickerView == primaryGoalPickerView {
            primaryGoalTextField.text = goal[row]
        }
        else if pickerView == secondaryGoalPickerView {
            secondaryGoalTextField.text = goal[row]
        }
        else if pickerView == gymAccessPickerView {
            gymAccessTextField.text = gymAccess[row]
        }
        else if pickerView == hoursPickerView{
            hoursTextField.text = hoursPerWeek[row]
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == heightPickerView {
            return height[row]
        }
        else if pickerView == primaryGoalPickerView {
            return goal[row]
        }
        else if pickerView == secondaryGoalPickerView {
            return goal[row]
        }
        else if pickerView == gymAccessPickerView {
            return gymAccess[row]
        }
        else if pickerView == hoursPickerView{
            return hoursPerWeek[row]
        }
        return nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 10.0, *) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                var userInfoArray:[UserInfo] = try context.fetch(UserInfo.fetchRequest())
                // If the UserInfo model is empty, then send the user to enter their information
                if userInfoArray.isEmpty {
                    navigationController?.navigationBar.isUserInteractionEnabled = false
                    navigationController?.isNavigationBarHidden = true
                }
            }
            catch {
                print("Fetching Failed")
            }
        }
    }
    
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var primaryGoalTextField: UITextField!
    
    @IBOutlet weak var secondaryGoalTextField: UITextField!
    
    @IBOutlet weak var gymAccessTextField: UITextField!
    
    @IBOutlet weak var hoursTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        heightTextField.inputView = heightPickerView
        heightPickerView.delegate = self
        heightPickerView.dataSource = self
        
        primaryGoalTextField.inputView = primaryGoalPickerView
        primaryGoalPickerView.delegate = self
        primaryGoalPickerView.dataSource = self
        
        secondaryGoalTextField.inputView = secondaryGoalPickerView
        secondaryGoalPickerView.delegate = self
        secondaryGoalPickerView.dataSource = self
        
        gymAccessTextField.inputView = gymAccessPickerView
        gymAccessPickerView.delegate = self
        gymAccessPickerView.dataSource = self
        
        hoursTextField.inputView = hoursPickerView
        hoursPickerView.delegate = self
        hoursPickerView.dataSource = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UserViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
