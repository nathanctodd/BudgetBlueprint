//
//  UpdateBudget.swift
//  BudgetBlueprint
//
//  Created by Nathan Todd on 1/16/22.
//

import Foundation
import UIKit

class UpdateBudget: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var textFieldEarned: UITextField!
    @IBOutlet weak var textFieldSaved: UITextField!
    @IBOutlet weak var titleString: UILabel!
    
    
    var budgetNumber = 0;
    let defaults = UserDefaults.standard
    
    @IBAction func next(_ sender: UIButton) {
        
        if ((textFieldEarned.hasText) && (textFieldEarned.text != "$") && (textFieldSaved.hasText) && (textFieldSaved.text != "$")) {

            let text = textFieldEarned.text!
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
            let newField = Int(substring) ?? 0
            
            let text2 = textFieldSaved.text!
            let index2 = text2.index(text2.endIndex, offsetBy: -1 * text2.count + 1)
            let substring2 = text2.suffix(from: index2)
            let newField2 = Int(substring2) ?? 0
            
            print(newField, newField2)
        
            if (budgetNumber == 1) {
                print("Budget 1 under way")
                var totalEarnings = defaults.integer(forKey: "budget1TotalEarnings")
                totalEarnings = totalEarnings + newField
                defaults.set(totalEarnings, forKey: "budget1TotalEarnings")
                var totalSavings = defaults.integer(forKey: "budget1TotalSavings")
                print(totalSavings)
                print(newField2)
                totalSavings = totalSavings + newField2
                print(totalSavings)
                defaults.set(totalSavings, forKey: "budget1TotalSavings")
                
            } else if (budgetNumber == 2) {
                
                var totalEarnings = defaults.integer(forKey: "budget2TotalEarnings")
                totalEarnings = totalEarnings + newField
                defaults.set(totalEarnings, forKey: "budget2TotalEarnings")
                var totalSavings = defaults.integer(forKey: "budget2TotalSavings")
                totalSavings = totalSavings + newField2
                defaults.set(totalSavings, forKey: "budget2TotalSavings")
                
            } else if (budgetNumber == 3) {
                
                var totalEarnings = defaults.integer(forKey: "budget3TotalEarnings")
                totalEarnings = totalEarnings + newField
                defaults.set(totalEarnings, forKey: "budget3TotalEarnings")
                var totalSavings = defaults.integer(forKey: "budget3TotalSavings")
                totalSavings = totalSavings + newField2
                defaults.set(totalSavings, forKey: "budget3TotalSavings")
                
            }
            
            
            let budgetUpdateIndex = defaults.integer(forKey: "budgetUpdateIndex")
            if budgetUpdateIndex == 1 {
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
                viewController.modalTransitionStyle = .crossDissolve
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            } else if budgetUpdateIndex == 2 {
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
                viewController.modalTransitionStyle = .crossDissolve
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            } else {
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
                viewController.modalTransitionStyle = .crossDissolve
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            }
        
        
        }
        
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    func nextButtonUpdate() {
        
        if ((textFieldEarned.hasText) && (textFieldEarned.text != "$") && (textFieldSaved.hasText) && (textFieldSaved.text != "$")) {
            UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseInOut, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                self.nextButton.isEnabled = true
            }, completion: {
                finished in
            })
        } else {
            UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseInOut, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.nextButton.isEnabled = false
            }, completion: {
                finished in
            })
        }
    }
    
    func textUpdate1() {
        var text = textFieldEarned.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                textFieldEarned.text = "$"
            } else {
                textFieldEarned.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                textFieldEarned.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    textFieldEarned.text = "$"
                } else {
                    textFieldEarned.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate2() {
        var text = textFieldSaved.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                textFieldSaved.text = "$"
            } else {
                textFieldSaved.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                textFieldSaved.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    textFieldSaved.text = "$"
                } else {
                    textFieldSaved.text = "$\(substring)"
                }
            }
        }
    }
    
    @IBAction func textFieldEditingDidChange1(_ sender: Any) {
        textUpdate1()
        nextButtonUpdate()
    }
    @IBAction func textFieldEditingDidChange2(_ sender: Any) {
        textUpdate2()
        nextButtonUpdate()
    }
    
    func start() {
        
        textFieldEarned.becomeFirstResponder()
        
    }
    
    override func viewDidLoad() {
        
        budgetNumber = defaults.integer(forKey: "budgetUpdate")
        switch budgetNumber {
        case 1:
            let title = defaults.string(forKey: "budget1Title")
            titleString.text = title
            break
        case 2:
            let title = defaults.string(forKey: "budget2Title")
            titleString.text = title
            break
        case 3:
            let title = defaults.string(forKey: "budget3Title")
            titleString.text = title
            break

        default:
            break
        }
        
        textFieldEarned.addTarget(self, action: #selector(textFieldEditingDidChange1(_:)), for: .editingChanged)
        textFieldSaved.addTarget(self, action: #selector(textFieldEditingDidChange2(_:)), for: .editingChanged)
        
        
        nextButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        backButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        textFieldEarned.layer.borderWidth = 2.0
        textFieldEarned.layer.borderColor = UIColor.gray.cgColor
        textFieldEarned.layer.cornerRadius = 10.0
        textFieldSaved.layer.borderWidth = 2.0
        textFieldSaved.layer.borderColor = UIColor.gray.cgColor
        textFieldSaved.layer.cornerRadius = 10.0
        nextButton.isEnabled = false
        titleString.adjustsFontSizeToFitWidth = true
        
        let delayTime2 = DispatchTime.now() + 0.3
        DispatchQueue.main.asyncAfter(deadline: delayTime2, execute: {
            self.start()
        })

        
    }
    
    
    
}
