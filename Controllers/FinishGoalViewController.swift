//
//  FinishGoalViewController.swift
//  GoalPost
//
//  Created by Tiago Santos on 23/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class FinishGoalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self
        addGestures()
    }
    
    func addGestures() {
        createGoalButton.bindToKeyBoard()
        self.hideKeyboardWhenTappedAround()
    }
    
    func initData(description: String, goalType: GoalType) {
        self.goalDescription = description
        self.goalType = goalType
    }
    
    @IBAction func backButtonWasTapped(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoalButtonWasTapped(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { (completed) in
                if completed {
                    dismiss(animated: true, completion: nil)
                }
            }
        } else {
            let textMissingUIAlertController = generateMissingTextController(message: "Please specify the amount of points.")
            present(textMissingUIAlertController, animated: true)
        }
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        
        guard let goalCompletionValue = Int32(pointsTextField.text!) else {
            let textMissingUIAlertController = generateMissingTextController(message: "Invalid characters inserted.")
            present(textMissingUIAlertController, animated: true)
            return
        }
        
        goal.goalCompletionValue = goalCompletionValue
        
        do {
            try managedContext.save()
            print("Successfully saved data.")
            completion(true)
        } catch {
            debugPrint("Could not save: \(goal.description)")
            completion(false)
        }
    }
}













