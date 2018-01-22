//
//  ViewController.swift
//  RetainCycles
//
//  Created by Ritika Srivastava on 21/01/18.
//  Copyright © 2018 Ritika Srivastava. All rights reserved.
//
// Test Retain Cycle

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
       // Instances of Person and Job class
        
        var John: Person? = Person()
        var developer: Job? = Job()
        
        // Reference the two objects with each other
        
        John?.job = developer
        developer?.person = John
        
        // Set the value to nil to check deallocation
        
        John = nil
        developer = nil
    
    }

    class Person{
        var job : Job?
        
        deinit{
        print("Deallocating Person")
       
        }
        
    }
    
    class Job{
        weak var person: Person?
        deinit {
         print("Deallocating Job")
        }
    }
}

