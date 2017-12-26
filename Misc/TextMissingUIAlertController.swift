//
//  TextMissingUIAlertController.swift
//  GoalPost
//
//  Created by Tiago Santos on 24/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

func generateMissingTextController(message: String) -> UIAlertController {
    let alert = UIAlertController(title: "Content missing.", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
    return alert
}
