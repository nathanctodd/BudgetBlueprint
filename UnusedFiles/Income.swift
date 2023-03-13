//
//  Income.swift
//  newDevelopment
//
//  Created by Nathan Todd on 12/9/21.
//

import Foundation
import UIKit

class Income: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var selection: UISegmentedControl!
    @IBOutlet weak var taxesIncluded: UISwitch!
    @IBOutlet weak var taxLabel: UILabel!
    
    let defaults = UserDefaults.standard
    var hasBeenChanged = false
    var incomeIndex = 0
    var income = 0
    
    @IBAction func back(_ sender: UIButton) {
        
        if ((textField.hasText) && (textField.text != "$")) {
            let text = textField.text!
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
            let stringNumber = Int(substring)
            defaults.set(stringNumber, forKey: "currentIncome")
            let number = selection.selectedSegmentIndex
            defaults.set(number, forKey: "incomeIndex")
            let taxesTakenOut = taxesIncluded.isOn
            defaults.set(taxesTakenOut, forKey: "taxesTakeOut")
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Balance") as! Balance
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Balance") as! Balance
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func next(_ sender: UIButton) {
        
        if ((textField.hasText) && (textField.text != "$")) {
            let text = textField.text!
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
            let stringNumber = Int(substring)
            defaults.set(stringNumber, forKey: "currentIncome")
            let number = selection.selectedSegmentIndex
            defaults.set(number, forKey: "incomeIndex")
            let taxesTakenOut = taxesIncluded.isOn
            defaults.set(taxesTakenOut, forKey: "taxesTakeOut")
            
            if (hasBeenChanged) {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "Advisement") as! Advisement
                newViewController.modalPresentationStyle = .fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
                
            } else {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "FixedExpenses") as! FixedExpenses
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            }
        } else {
            print("Error: No text in box")
        }
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        
        print(taxesIncluded.state)
        
    }
    
    func textFieldShouldReturn(_ textField2: UITextField) -> Bool {
        
        if (textField.hasText) {
            next(nextButton)
            return false
        }
        return true
    }
    
    
    @IBAction func textFieldEditingDidChange(_ sender: Any) {
        textUpdate()
    }
    
    func textUpdate() {
        var text = textField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                textField.text = "$"
                
            } else {
                textField.text = "$\(substring)"
            }
            
            if ((textField.hasText) && (textField.text != "$")) {
                nextButton.isEnabled = true
                textField.font = UIFont(name: "Futura", size: 44)
                
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                    self.nextButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }, completion: {
                    finished in
                })
                
            } else {
                
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                    self.nextButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                }, completion: {
                    finished in
                })
                
                nextButton.isEnabled = false
                textField.font = UIFont(name: "Futura", size: 30)
                }
            
        } else {
        
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                textField.text = "$\(substring)"
            
            if ((textField.hasText) && (textField.text != "$")) {
                nextButton.isEnabled = true
                textField.font = UIFont(name: "Futura", size: 44)
                
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                    self.nextButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }, completion: {
                    finished in
                })
                
            } else {
                
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                    self.nextButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                }, completion: {
                    finished in
                })
                
                nextButton.isEnabled = false
                textField.font = UIFont(name: "Futura", size: 30)
                }
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    textField.text = "$"
                    
                } else {
                    textField.text = "$\(substring)"
                }
                
                if ((textField.hasText) && (textField.text != "$")) {
                    nextButton.isEnabled = true
                    textField.font = UIFont(name: "Futura", size: 44)
                    
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                        self.nextButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    }, completion: {
                        finished in
                    })
                    
                } else {
                    
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                        self.nextButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                    }, completion: {
                        finished in
                    })
                    
                    nextButton.isEnabled = false
                    textField.font = UIFont(name: "Futura", size: 30)
                    }
            }
        }
    }
    
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        
        switch selection.selectedSegmentIndex {
            
        case 0:
            incomeIndex = 0
            break
        case 1:
            incomeIndex = 1
            break
        case 2:
            incomeIndex = 2
        default:
            print("DefaultSegmentedController ACTIVATED")
            break
            
        }
    }
    
    func openingAnimations() {
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseInOut, animations: {
            self.label.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.18, options: .curveEaseInOut, animations: {
            self.textField.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.36, options: .curveEaseInOut, animations: {
            self.selection.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.54, options: .curveEaseInOut, animations: {
            self.taxesIncluded.center.x = self.view.frame.midX + 85
            self.taxLabel.center.x = self.view.frame.midX - 39
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.74, options: .curveEaseInOut, animations: {
            self.nextButton.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        
        
    }
    

    
    func start() {
        textField.becomeFirstResponder()
    }
    
    
    override func viewDidLoad() {
        
        hasBeenChanged = defaults.bool(forKey: "hasBeenChanged")
        if (hasBeenChanged) {
            backButton.isHidden = true
            nextButton.setTitle("Confirm", for: .normal)
        }
        
        nextButton.isEnabled = false
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: .editingChanged)
        textField.becomeFirstResponder()
        taxesIncluded.addTarget(self, action: #selector(switchDidChange(_:)), for: .valueChanged)
        label.center.x = 0 - label.frame.width
        selection.center.x = 0 - selection.frame.width
        textField.center.x = 0 - textField.frame.width
        taxLabel.center.x = 0 - taxLabel.frame.width
        taxesIncluded.center.x = 0 - taxesIncluded.frame.width
        nextButton.center.x = 0 - nextButton.frame.width
        textField.delegate = self
        
        income = defaults.integer(forKey: "currentIncome")
        incomeIndex = defaults.integer(forKey: "incomeIndex")
        if (incomeIndex == 0) {
            selection.selectedSegmentIndex = 0
        } else if (incomeIndex == 1) {
            selection.selectedSegmentIndex = 1
        }
        print("Income: ", income)
        textField.text = String(income)
        textUpdate()
        
        let delayTime = DispatchTime.now() + 0.01
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            self.openingAnimations()
        })
        let delayTime2 = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: delayTime2, execute: {
            self.start()
        })
        
    }
    
    
    
}
