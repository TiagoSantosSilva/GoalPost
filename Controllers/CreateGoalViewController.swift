//
//  CreateGoalViewController.swift
//  GoalPost
//
//  Created by Tiago Santos on 23/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
        goalType = .shortTerm
        setShortTermButtonAsSelected()
        addGestures()
    }
    
    func addGestures() {
        nextButton.bindToKeyBoard()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func shortTermButtonWasTapped(_ sender: Any) {
        goalType = .shortTerm
        setShortTermButtonAsSelected()
    }
    
    @IBAction func longTermButtonWasTapped(_ sender: Any) {
        goalType = .longTerm
        setLongTermButtonAsSelected()
    }
    
    @IBAction func nextButtonWasTapped(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            let finishGoalViewController = FinishGoalViewController()
            finishGoalViewController.initData(description: goalTextView.text, goalType: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalViewController)
        } else {
            let textMissingUIAlertController = generateMissingTextController(message: "Please specify your goal.")
            present(textMissingUIAlertController, animated: true)
        }
    }
    
    @IBAction func backButtonWasTapped(_ sender: Any) {
        dismissDetail()
    }
    
    fileprivate func setShortTermButtonAsSelected() {
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }
    
    fileprivate func setLongTermButtonAsSelected() {
        shortTermButton.setDeselectedColor()
        longTermButton.setSelectedColor()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
