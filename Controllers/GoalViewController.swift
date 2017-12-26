//
//  ViewController.swift
//  GoalPost
//
//  Created by Tiago Santos on 23/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalViewController: UIViewController {
    
    @IBOutlet weak var goalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTableView.delegate = self
        goalTableView.dataSource = self
        goalTableView.isHidden = false
    }
    
    @IBAction func addGoalButtonWasTapped(_ sender: Any) {
        let createGoalViewController = CreateGoalViewController()
        presentDetail(createGoalViewController)
    }
}

