//
//  ViewController.swift
//  JDFitness
//
//  Created by Jonathan Deehan on 28/09/2016.
//  Copyright © 2016 jdblogs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func fitnessButton(_ sender: UIButton) {
    }

    @IBAction func nutritionButton(_ sender: UIButton) {
    }
    
    @IBAction func resultsButton(_ sender: UIButton) {
    }
    
    @IBAction func userInfoButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if #available(iOS 10.0, *) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                var userInfoArray:[UserInfo] = try context.fetch(UserInfo.fetchRequest())
                // If the UserInfo model is empty, then send the user to enter their information
                if userInfoArray.isEmpty {
                    // Move to user input controller to enter informaton
                    // [First time use of app essentially, move to the correct viewcontroller]
                    self.performSegue(withIdentifier: "InitialStartupUserInfo", sender: self)
                }
            }
            catch {
                print("Fetching Failed")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

