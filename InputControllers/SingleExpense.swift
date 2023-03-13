//
//  SingleExpense.swift
//  BudgetBlueprint
//
//  Created by Nathan Todd on 1/30/22.
//

import Foundation
import UIKit


class SingleExpense: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var descriptionStringLabel: UILabel!
    
    
    let defaults = UserDefaults.standard
    var expenseNumber = -1
    var budgetNumber = -1
    
    @IBAction func back(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Advisement") as! Advisement
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        
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
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                textField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    textField.text = "$"
                } else {
                    textField.text = "$\(substring)"
                }
            }
        }
    }
    
    
    func nextButtonUpdate() {
        
        if ((textField.hasText) && (textField.text != "$")) {
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
    
    
    @IBAction func next(_ sender: UIButton) {
        
        if ((textField.hasText) && (textField.text != "$")) {
            let text = textField.text!
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
            let newField = Int(substring) ?? 0

            if (budgetNumber == 1) {
                
                switch expenseNumber {
                case 0:
                    defaults.set(newField, forKey: "budget1House")
                    break
                case 1:
                    defaults.set(newField, forKey: "budget1Bills")
                    break
                case 2:
                    defaults.set(newField, forKey: "budget1Car")
                    break
                case 3:
                    defaults.set(newField, forKey: "budget1Utilities")
                    break
                case 4:
                    defaults.set(newField, forKey: "budget1Insurance")
                    break
                case 5:
                    defaults.set(newField, forKey: "budget1Memberships")
                    break
                case 6:
                    defaults.set(newField, forKey: "budget1Charity")
                    break
                case 7:
                    defaults.set(newField, forKey: "budget1Income")
                    defaults.set(1, forKey: "budget1IncomeIndex")
                default:
                    break
                }
                
            } else if budgetNumber == 2 {
                
                switch expenseNumber {
                case 0:
                    defaults.set(newField, forKey: "budget2House")
                    break
                case 1:
                    defaults.set(newField, forKey: "budget2Bills")
                    break
                case 2:
                    defaults.set(newField, forKey: "budget2Car")
                    break
                case 3:
                    defaults.set(newField, forKey: "budget2Utilities")
                    break
                case 4:
                    defaults.set(newField, forKey: "budget2Insurance")
                    break
                case 5:
                    defaults.set(newField, forKey: "budget2Memberships")
                    break
                case 6:
                    defaults.set(newField, forKey: "budget2Charity")
                    break
                case 7:
                    defaults.set(newField, forKey: "budget2Income")
                    defaults.set(1, forKey: "budget2IncomeIndex")
                default:
                    break
                }
                
            } else if budgetNumber == 3 {
                
                switch expenseNumber {
                case 0:
                    defaults.set(newField, forKey: "budget3House")
                    break
                case 1:
                    defaults.set(newField, forKey: "budget3Bills")
                    break
                case 2:
                    defaults.set(newField, forKey: "budget3Car")
                    break
                case 3:
                    defaults.set(newField, forKey: "budget3Utilities")
                    break
                case 4:
                    defaults.set(newField, forKey: "budget3Insurance")
                    break
                case 5:
                    defaults.set(newField, forKey: "budget3Memberships")
                    break
                case 6:
                    defaults.set(newField, forKey: "budget3Charity")
                    break
                case 7:
                    defaults.set(newField, forKey: "budget3Income")
                    defaults.set(1, forKey: "budget3IncomeIndex")
                default:
                    break
                }
            }
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewC = storyboard.instantiateViewController(withIdentifier: "Advisement") as! Advisement
            viewC.modalTransitionStyle = .crossDissolve
            viewC.modalPresentationStyle = .fullScreen
            self.present(viewC, animated: true, completion: nil)
                
        }
    }
    
    
    
    
    
    @IBAction func textFieldEditingDidChange1(_ sender: Any) {
        textUpdate()
        nextButtonUpdate()
    }
    
    func start() {
        
        textField.becomeFirstResponder()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        
        expenseNumber = defaults.integer(forKey: "expenseNumber")
        budgetNumber = defaults.integer(forKey: "budgetCreation")
        let descript = defaults.string(forKey: "descript")
        
        nextButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        backButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        iconImage.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)

        
        textField.addTarget(self, action: #selector(textFieldEditingDidChange1(_:)), for: .editingChanged)
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 10.0
        nextButton.isEnabled = false
        descriptionStringLabel.text = descript
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionStringLabel.adjustsFontSizeToFitWidth = true
        titleLabel.adjustsFontSizeToFitWidth = true
        
        var title = ""
        if budgetNumber == 1 {
            title = defaults.string(forKey: "budget1Title") ?? ""
        } else if budgetNumber == 2 {
            title = defaults.string(forKey: "budget2Title") ?? ""
        } else if budgetNumber == 3 {
            title = defaults.string(forKey: "budget3Title") ?? ""
        }
        titleLabel.text = title
        
        switch expenseNumber {
        case 0:
            iconImage.image = UIImage(systemName: "house")
            descriptionLabel.text = "House Payment:"
            textField.placeholder = "House"
            break
        case 1:
            iconImage.image = UIImage(systemName: "cart")
            descriptionLabel.text = "Groceries & Personal:"
            textField.placeholder = "Groceries"
            break
        case 2:
            iconImage.image = UIImage(systemName: "car")
            descriptionLabel.text = "Transportation:"
            textField.placeholder = "Transportation"
            break
        case 3:
            iconImage.image = UIImage(systemName: "wrench")
            descriptionLabel.text = "Utilities & Bills:"
            textField.placeholder = "Utilities & Bills"
            break
        case 4:
            iconImage.image = UIImage(systemName: "checkmark.shield")
            descriptionLabel.text = "Insurance Cost:"
            textField.placeholder = "Insurance"
            break
        case 5:
            iconImage.image = UIImage(systemName: "envelope")
            descriptionLabel.text = "Memberships:"
            textField.placeholder = "Memberships"
            break
        case 6:
            iconImage.image = UIImage(systemName: "cross")
            descriptionLabel.text = "Charity Donations:"
            textField.placeholder = "Charity"
            break
        case 7:
            iconImage.image = UIImage(systemName: "dollarsign.square")
            descriptionLabel.text = "Income (Per Month):"
            textField.placeholder = "Income per Month"
            break
        case 8:
            iconImage.image = UIImage(systemName: "dollarsign.square")
            descriptionLabel.text = "Other Expenses:"
            textField.placeholder = "Expenses"
            break
        default:
            iconImage.image = UIImage(systemName: "exclamationmark")
            break
        }
        
        let delayTime2 = DispatchTime.now() + 0.3
        DispatchQueue.main.asyncAfter(deadline: delayTime2, execute: {
            self.start()
        })
        
    }
}
