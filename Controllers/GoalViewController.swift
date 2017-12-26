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
    
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTableView.delegate = self
        goalTableView.dataSource = self
        goalTableView.isHidden = false
    }
    
    func fetchCoreDataObjects() {
        self.fetchGoals { (complete) in
            if complete {
                if goals.count > 0 {
                    goalTableView.isHidden = false
                } else {
                    goalTableView.isHidden = true
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        goalTableView.reloadData()
    }
    
    @IBAction func addGoalButtonWasTapped(_ sender: Any) {
        let createGoalViewController = CreateGoalViewController()
        presentDetail(createGoalViewController)
    }
}

