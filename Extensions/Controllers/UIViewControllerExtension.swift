//
//  UIViewControllerExtension.swift
//  GoalPost
//
//  Created by Tiago Santos on 23/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = createTransition(duration: 0.3, transitionType: kCATransitionPush, transitionSubType: kCATransitionFromRight)
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: nil)
        // The animation was already overwritten in the transition.
    }
    
    func dismissDetail() {
        let transition = createTransition(duration: 0.3, transitionType: kCATransitionPush, transitionSubType: kCATransitionFromLeft)
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    fileprivate func createTransition(duration: CFTimeInterval, transitionType: String, transitionSubType: String?) -> CATransition {
        let transition = CATransition()
        transition.duration = duration
        transition.type = transitionType
        transition.subtype = transitionSubType!
        return transition
    }
    
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
        let transition = createTransition(duration: 0.3, transitionType: kCATransitionPush, transitionSubType: kCATransitionFromRight)
        
        guard let presentedViewController = presentedViewController else { return }
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
