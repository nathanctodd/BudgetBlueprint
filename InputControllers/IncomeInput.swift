//
//  IncomeInput.swift
//  newDevelopment
//
//  Created by Nathan Todd on 12/2/21.
//

import Foundation
import UIKit
import CoreData


class IncomeInput: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var goalAmountLabel: UILabel!
    @IBOutlet weak var actualGoalAmountTextiField: UITextField!
    @IBOutlet weak var expectedIncomeLabel: UILabel!
    @IBOutlet weak var actualExpectedIncomeTextField: UITextField!
    @IBOutlet weak var selection: UISegmentedControl!
    @IBOutlet weak var startingBalanceLabel: UILabel!
    @IBOutlet weak var actualStartingBalanceTextField: UITextField!
    @IBOutlet weak var deadline: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deleteBudget: UIButton!
    

    var dayCounts = 0
    var dateSelected = false
    var hasBeenChanged = false
    let defaults = UserDefaults.standard
    var budgetNumber = 0
    var goalAmount = 0
    var expectedIncome = 0
    var startingBalance = 0
    var days = 0
    var inputIndex = 0;
    
    
    @IBAction func textFieldEditingDidChange(_ sender: Any) {
        textUpdate()
        nextButtonUpdate()
    }
    
    @IBAction func textFieldEditingDidChange2(_ sender: Any) {
        textUpdate2()
        nextButtonUpdate()
    }
    
    @IBAction func textFieldEditingDidChange3(_ sender: Any) {
        textUpdate3()
        nextButtonUpdate()
    }
    
    @IBAction func deleteBudget(_ sender: Any) {
        
        let confirmDelete = UIAlertController(title: "Confirm", message: "Are you sure you want to delete the budget?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Confirm", style: .default, handler: { (action) -> Void in
                    print("Ok button click...")
                    self.confirmDelete()
               })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                    print("Cancel button click...")
                }
        confirmDelete.addAction(ok)
        confirmDelete.addAction(cancel)
        self.present(confirmDelete, animated: true, completion: nil)
    }
    
    func confirmDelete() {
        
        if (budgetNumber == 1) {
            defaults.set("", forKey: "budget1Title")
            defaults.set(0, forKey: "budget1Expense")
            defaults.set(0, forKey: "budget1StartBalance")
            defaults.set(0, forKey: "budget1ExpectedIncome")
            defaults.set(0, forKey: "budget1IncomeIndex")
            defaults.set(0, forKey: "budget1House")
            defaults.set(0, forKey: "budget1Utilities")
            defaults.set(0, forKey: "budget1Bills")
            defaults.set(0, forKey: "budget1Tuition")
            defaults.set(0, forKey: "budget1Insurance")
            defaults.set(0, forKey: "budget1Car")
            defaults.set(0, forKey: "budget1Other")
            defaults.set(0, forKey: "budget1Charity")
            defaults.set(0, forKey: "budget1Memberships")
            defaults.set(0, forKey: "budgetOverview")
            defaults.set(false, forKey: "budget1Complete")
            defaults.set(0, forKey: "budget1TotalSavings")
            defaults.set(0, forKey: "budget1Creation")
            defaults.set(false, forKey: "budget1Exists")
        } else if (budgetNumber == 2) {
            defaults.set("", forKey: "budget2Title")
            defaults.set(0, forKey: "budget2Expense")
            defaults.set(0, forKey: "budget2StartBalance")
            defaults.set(0, forKey: "budget2ExpectedIncome")
            defaults.set(0, forKey: "budget2IncomeIndex")
            defaults.set(0, forKey: "budget2House")
            defaults.set(0, forKey: "budget2Utilities")
            defaults.set(0, forKey: "budget2Bills")
            defaults.set(0, forKey: "budget2Tuition")
            defaults.set(0, forKey: "budget2Insurance")
            defaults.set(0, forKey: "budget2Car")
            defaults.set(0, forKey: "budget2Other")
            defaults.set(0, forKey: "budget2Charity")
            defaults.set(0, forKey: "budget2Memberships")
            defaults.set(0, forKey: "budgetOverview")
            defaults.set(false, forKey: "budget2Complete")
            defaults.set(0, forKey: "budget2TotalSavings")
            defaults.set(0, forKey: "budget2Creation")
            defaults.set(false, forKey: "budget2Exists")
        } else if (budgetNumber == 3) {
            defaults.set("", forKey: "budget3Title")
            defaults.set(0, forKey: "budget3Expense")
            defaults.set(0, forKey: "budget3StartBalance")
            defaults.set(0, forKey: "budget3ExpectedIncome")
            defaults.set(0, forKey: "budget3IncomeIndex")
            defaults.set(0, forKey: "budget3House")
            defaults.set(0, forKey: "budget3Utilities")
            defaults.set(0, forKey: "budget3Bills")
            defaults.set(0, forKey: "budget3Tuition")
            defaults.set(0, forKey: "budget3Insurance")
            defaults.set(0, forKey: "budget3Car")
            defaults.set(0, forKey: "budget3Other")
            defaults.set(0, forKey: "budget3Charity")
            defaults.set(0, forKey: "budget3Memberships")
            defaults.set(0, forKey: "budgetOverview")
            defaults.set(false, forKey: "budget3Complete")
            defaults.set(0, forKey: "budget3TotalSavings")
            defaults.set(0, forKey: "budget3Creation")
            defaults.set(false, forKey: "budget3Exists")
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    func nextButtonUpdate() {
        
        if (((actualGoalAmountTextiField.hasText) && (actualGoalAmountTextiField.text != "$")) && ((actualExpectedIncomeTextField.hasText) && (actualExpectedIncomeTextField.text != "$")) && ((actualStartingBalanceTextField.hasText) && (actualStartingBalanceTextField.text != "$")) && (dateSelected == true)) {
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
    
    func textUpdate() {
        var text = actualGoalAmountTextiField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                actualGoalAmountTextiField.text = "$"
            } else {
                actualGoalAmountTextiField.text = "$\(substring)"
            }
            
        } else {
        
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                actualGoalAmountTextiField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    actualGoalAmountTextiField.text = "$"
                } else {
                    actualGoalAmountTextiField.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate2() {
        var text = actualExpectedIncomeTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                actualExpectedIncomeTextField.text = "$"
            } else {
                actualExpectedIncomeTextField.text = "$\(substring)"
            }
        } else {
        
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                actualExpectedIncomeTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    actualExpectedIncomeTextField.text = "$"
                } else {
                    actualExpectedIncomeTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    
    func textUpdate3() {
        var text = actualStartingBalanceTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                actualStartingBalanceTextField.text = "$"
            } else {
                actualStartingBalanceTextField.text = "$\(substring)"
            }
        } else {
        
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                actualStartingBalanceTextField.text = "$\(substring)"
            
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    actualStartingBalanceTextField.text = "$"
                    
                } else {
                    actualStartingBalanceTextField.text = "$\(substring)"
                }
            }
        }
    }


    
    @IBAction func backButton(_ sender: UIButton) {

            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func datePickerDidUpdate(_ sender: Any) {
        if (dateSelected == false) {
            dateSelected = true
        }
        print("Editing did begin(): ")
        let date = datePicker.date
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        print(components)
        days = components.day!
        if (days < 1) {
            dateSelected = false
        }
        nextButtonUpdate()
    }
    
    
    
    @IBAction func nextButton(_ sender: UIButton) {
    
        print("This is insane")
        
        if ((actualGoalAmountTextiField.hasText) && (actualGoalAmountTextiField.text != "$") && (actualExpectedIncomeTextField.hasText) && (actualExpectedIncomeTextField.text != "$") && (actualStartingBalanceTextField.hasText) && (actualStartingBalanceTextField.text != "$") && (dateSelected == true)) {
            
            let text = actualGoalAmountTextiField.text!
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
            let stringNumber1 = Int(substring)
            
            let text2 = actualExpectedIncomeTextField.text!
            let index2 = text2.index(text2.endIndex, offsetBy: -1 * text2.count + 1)
            let substring2 = text2.suffix(from: index2)
            let stringNumber2 = Int(substring2)
            
            let text3 = actualStartingBalanceTextField.text!
            let index3 = text3.index(text3.endIndex, offsetBy: -1 * text3.count + 1)
            let substring3 = text3.suffix(from: index3)
            let stringNumber3 = Int(substring3)
            
            print(budgetNumber)
            
            if (budgetNumber == 1) {
                goalAmount = stringNumber1 ?? 0
                defaults.set(goalAmount, forKey: "budget1Expense")
                expectedIncome = stringNumber2 ?? 0
                defaults.set(expectedIncome, forKey: "budget1ExpectedIncome")
                let number = selection.selectedSegmentIndex
                defaults.set(number, forKey: "budget1IncomeIndex")
                startingBalance = stringNumber3 ?? 0
                print("Starting Balance",startingBalance)
                defaults.set(startingBalance, forKey: "budget1StartingBalance")
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                    self.datePicker.center.x = self.view.frame.midX
                }, completion: {
                    finished in
                })
                let date = datePicker.date
                defaults.set(date, forKey: "budget1EndDate")
                let date2 = Date()
                defaults.set(date2, forKey: "budget1StartingDate")
        
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "FixedExpenses") as! FixedExpenses
                newViewController.modalPresentationStyle = .fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
            
            } else if (budgetNumber == 2) {
                goalAmount = stringNumber1 ?? 0
                defaults.set(goalAmount, forKey: "budget2Expense")
                expectedIncome = stringNumber2 ?? 0
                defaults.set(expectedIncome, forKey: "budget2ExpectedIncome")
                let number = selection.selectedSegmentIndex
                defaults.set(number, forKey: "budget2IncomeIndex")
                startingBalance = stringNumber3 ?? 0
                defaults.set(startingBalance, forKey: "budget2StartingBalance")
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                    self.datePicker.center.x = self.view.frame.midX
                }, completion: {
                    finished in
                })
                let date = datePicker.date
                defaults.set(date, forKey: "budget2EndDate")
                let date2 = Date()
                defaults.set(date2, forKey: "budget2StartingDate")
        
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "FixedExpenses") as! FixedExpenses
                newViewController.modalPresentationStyle = .fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
            } else if (budgetNumber == 3) {
                goalAmount = stringNumber1 ?? 0
                defaults.set(goalAmount, forKey: "budget3Expense")
                expectedIncome = stringNumber2 ?? 0
                defaults.set(expectedIncome, forKey: "budget3ExpectedIncome")
                let number = selection.selectedSegmentIndex
                defaults.set(number, forKey: "budget3IncomeIndex")
                startingBalance = stringNumber3 ?? 0
                defaults.set(startingBalance, forKey: "budget3StartingBalance")
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                    self.datePicker.center.x = self.view.frame.midX
                }, completion: {
                    finished in
                })
                let date = datePicker.date
                defaults.set(date, forKey: "budget3EndDate")
                let date2 = Date()
                defaults.set(date2, forKey: "budget3StartingDate")
        
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "FixedExpenses") as! FixedExpenses
                newViewController.modalPresentationStyle = .fullScreen
                newViewController.modalTransitionStyle = .crossDissolve
                self.present(newViewController, animated: true, completion: nil)
            }
                        
        } else {
            print("Error: No text in box. Not all inputs are available.")
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
   
    func openingAnimations() {
        
        
        
    }
    
    func start() {
        actualGoalAmountTextiField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField2: UITextField) -> Bool {
        
        if (actualGoalAmountTextiField.hasText) {
            nextButton(nextButton)
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        
        budgetNumber = defaults.integer(forKey: "budgetCreation")
        deleteBudget.layer.cornerRadius = 20.0
        deleteBudget.tintColor = .red
        datePicker.minimumDate = Date(timeIntervalSinceNow: 0)

        nextButton.isEnabled = false
        actualGoalAmountTextiField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: .editingChanged)
        actualExpectedIncomeTextField.addTarget(self, action: #selector(textFieldEditingDidChange2(_:)), for: .editingChanged)
        actualStartingBalanceTextField.addTarget(self, action: #selector(textFieldEditingDidChange3(_:)), for: .editingChanged)
        
        actualGoalAmountTextiField.borderStyle = .roundedRect
        actualExpectedIncomeTextField.borderStyle = .roundedRect
        actualStartingBalanceTextField.borderStyle = .roundedRect
        
        actualGoalAmountTextiField.returnKeyType = .next
        actualExpectedIncomeTextField.returnKeyType = .next
        actualStartingBalanceTextField.returnKeyType = .next
        
        backButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        nextButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)

        
        actualGoalAmountTextiField.delegate = self
        actualExpectedIncomeTextField.delegate = self
        actualStartingBalanceTextField.delegate = self
        
        textUpdate()
        //budgetNumber = defaults.integer(forKey: "budgetCreation")
        switch (budgetNumber) {
        case 1:
            let title = defaults.string(forKey: "budget1Title")
            titleLabel.text = title
            break
        case 2:
            let title = defaults.string(forKey: "budget2Title")
            titleLabel.text = title
            break
        case 3:
            let title = defaults.string(forKey: "budget3Title")
            titleLabel.text = title
            break
        default:
            titleLabel.text = "Default"
            break
        }



        let delayTime = DispatchTime.now() + 0.1
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            self.openingAnimations()
        })
        let delayTime2 = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: delayTime2, execute: {
            self.start()
        })
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

