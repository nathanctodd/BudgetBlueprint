//
//  Name.swift
//  BudgetBlueprint
//
//  Created by Nathan Todd on 12/24/21.
//

import Foundation
import UIKit

class BudgetName: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    let defaults = UserDefaults.standard
    var budgetNumber = 0
    
    @IBAction func next(_ sender: UIButton) {
                
        if (textField.hasText) {
            let budgetName = textField.text
            if (budgetNumber == 1) {
                defaults.set(budgetName, forKey: "budget1Title")
            } else if (budgetNumber == 2) {
                defaults.set(budgetName, forKey: "budget2Title")
            } else if (budgetNumber == 3) {
                defaults.set(budgetName, forKey: "budget3Title")
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "IncomeInput") as! IncomeInput
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
        
    @IBAction func back(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    @objc func textFieldEditingDidChange(_ sender: Any) {
        updateText()
    }
    
    func textFieldShouldReturn(_ textField2: UITextField) -> Bool {
        
        if (textField.hasText) {
            next(nextButton)
            return false
        }
        return true
    }
    
    func updateText() {
        
        if (textField.hasText) {
                
            UIView.animate(withDuration: 0.4, delay: 0.01, options: .curveEaseInOut, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.nextButton.isEnabled = true
            }, completion: {
                finished in
            })
        } else {
            UIView.animate(withDuration: 0.4, delay: 0.01, options: .curveEaseInOut, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                self.nextButton.isEnabled = false
            }, completion: {
                finished in
            })
        }
        
    }
    
    
    func openingAnimations() {
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseInOut, animations: {
            self.titleLabel.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.18, options: .curveEaseInOut, animations: {
            self.textField.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.36, options: .curveEaseInOut, animations: {
            self.nextButton.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        
    }
    
    func start() {
        textField.becomeFirstResponder()
    }
    
    
    override func viewDidLoad() {
    
        textField.borderStyle = .roundedRect
        textField.layer.cornerCurve = .continuous
        textField.placeholder = "Enter Budget Name"
        textField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: .editingChanged)
        textField.returnKeyType = .done
        textField.delegate = self
        nextButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        nextButton.isEnabled = false
        titleLabel.center.x = 0 - titleLabel.frame.width
        textField.center.x = 0 - textField.frame.width
        nextButton.center.x = 0 - nextButton.frame.width
        
        budgetNumber = defaults.integer(forKey: "budgetCreation")
        
        backButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        nextButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)

        
        let delay = DispatchTime.now() + 0.01
        DispatchQueue.main.asyncAfter(deadline: delay, execute: {self.openingAnimations()})
        let delay2 = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: delay2, execute: {self.start()})
        
    }
    
}
