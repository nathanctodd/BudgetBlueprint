//
//  Balance.swift
//  newDevelopment
//
//  Created by Nathan Todd on 12/9/21.
//

import Foundation
import UIKit


class Balance: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    let defaults = UserDefaults.standard
    var startBalance = 0


    
    
    @IBAction func back(_ sender: UIButton) {
        
        if ((textField.hasText) && (textField.text != "$")) {
            let text = textField.text!
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
            let stringNumber = Int(substring)
            defaults.set(stringNumber, forKey: "startbalance")
            
           
            
        } else {
            print("Error: No text in box")
        }
        
    }
    
    @IBAction func next(_ sender: UIButton) {
        
        if ((textField.hasText) && (textField.text != "$")) {
            let text = textField.text!
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
            let stringNumber = Int(substring)
            defaults.set(stringNumber, forKey: "startbalance")

            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Income") as! Income
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            
        } else {
            print("Error: No text in box")
        }
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    func openingAnimations() {
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseInOut, animations: {
            self.label.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.18, options: .curveEaseInOut, animations: {
            self.descriptionLabel.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.36, options: .curveEaseInOut, animations: {
            self.textField.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.54, options: .curveEaseInOut, animations: {
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
        textField.placeholder = "Enter Amount"
        textField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: .editingChanged)
        nextButton.isEnabled = false
        textField.becomeFirstResponder()
        nextButton.center.x = 0 - nextButton.frame.width
        textField.center.x = 0 - textField.frame.width
        descriptionLabel.center.x = 0 - descriptionLabel.frame.width
        label.center.x = 0 - label.frame.width
        textField.delegate = self
        startBalance = defaults.integer(forKey: "startbalance")
        textField.text = String(startBalance)
        textUpdate()
        
        
        let delayTime = DispatchTime.now() + 0.1
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            self.openingAnimations()
        })
        let delayTime2 = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: delayTime2, execute: {
            self.start()
        })
    }
    
}




