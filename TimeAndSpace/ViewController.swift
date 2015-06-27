//
//  ViewController.swift
//  TimeAndSpace
//
//  Created by Ozeryansky, Michael on 6/27/15.
//  Copyright (c) 2015 Michael Ozeryansky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeButtonHeightConstriant: NSLayoutConstraint!
    
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var spaceButton: UIButton!
    @IBOutlet weak var exploreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    
    @IBAction func timeButtonPressed(sender: UIButton) {
    }
    
    @IBAction func spaceButtonPressed(sender: UIButton) {
    }
    
    @IBAction func exploreButtonPressed(sender: UIButton) {
        
        timeButtonHeightConstriant.constant += 2
    }
}

