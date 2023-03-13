//
//  Home.swift
//  newDevelopment
//
//  Created by Nathan Todd on 12/15/21.
//

import Foundation
import UIKit

struct BudgetState{
    
    static let NotPossible : UInt32 = 0
    static let AdvismentNeeded : UInt32 = 0b1
    static let BudgetReady : UInt32 = 0b10
    static let None : UInt32 = 0b11
    
}



class Home : UIViewController {
    
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fundsAvailableLabel: UILabel!
    @IBOutlet weak var moneyAvailableLabel: UILabel!
    @IBOutlet weak var actualBudgetGoal: UILabel!
    @IBOutlet weak var budgetGoalLabel: UILabel!
    @IBOutlet weak var amountToSaveWeekly: UILabel!
    @IBOutlet weak var actualAmount: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var givenLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var saveAndQuitButton: UIButton!
    let defaults = UserDefaults.standard
    var currentBudgetState = BudgetState.None
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        let budgetNumber = defaults.integer(forKey: "budgetCreation")
        if budgetNumber == 1 {
            defaults.set(true, forKey: "budget1Exists")
        } else if budgetNumber == 2 {
            defaults.set(true, forKey: "budget2Exists")
        } else if budgetNumber == 3 {
            defaults.set(true, forKey: "budget3Exists")
        }
        
        if (currentBudgetState == BudgetState.BudgetReady) {
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
            
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Advisement") as! Advisement
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveAndQuit(_ sender: UIButton) {
        
        let budgetNumber = defaults.integer(forKey: "budgetCreation")
        if budgetNumber == 1 {
            defaults.set(true, forKey: "budget1Exists")
        } else if budgetNumber == 2 {
            defaults.set(true, forKey: "budget2Exists")
        } else if budgetNumber == 3 {
            defaults.set(true, forKey: "budget3Exists")
        }

        if (currentBudgetState == BudgetState.BudgetReady) {
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
            
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    
    func openingAnimations() {
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseInOut, animations: {
            self.nameLabel.center.x = self.view.frame.midX + 38
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.50, options: .curveEaseInOut, animations: {
            self.ProfileImage.center.x = self.view.frame.midX - 153
            self.ProfileImage.alpha = 1.0
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.78, options: .curveEaseInOut, animations: {
            self.amountToSaveWeekly.center.y = self.view.frame.midY - 230
            self.amountToSaveWeekly.alpha = 1.0
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.96, options: .curveEaseInOut, animations: {
            self.actualAmount.center.y = self.view.frame.midY - 170
            self.actualAmount.alpha = 1.0
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseInOut, animations: {
            self.actualAmount.center.y = self.view.frame.midY - 170
            self.actualAmount.alpha = 1.0
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseInOut, animations: {
                    self.actualAmount.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }, completion: {
                    finished in
                })
                UIView.animate(withDuration: 0.5, delay: 2.5, options: .curveEaseInOut, animations: {
                    self.actualAmount.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: {
                    finished in
                })
        
        
        
        UIView.animate(withDuration: 1.0, delay: 3.2, options: .curveEaseInOut, animations: {
            self.fundsAvailableLabel.center.y = self.view.frame.midY - 50
            self.fundsAvailableLabel.alpha = 1.0
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 1.0, delay: 3.2, options: .curveEaseInOut, animations: {
            self.moneyAvailableLabel.center.y = self.view.frame.midY - 50
            self.moneyAvailableLabel.alpha = 1.0
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 1.0, delay: 3.5, options: .curveEaseInOut, animations: {
            self.budgetGoalLabel.center.y = self.view.frame.midY + 30
            self.budgetGoalLabel.alpha = 1.0
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 1.0, delay: 3.5, options: .curveEaseInOut, animations: {
            self.actualBudgetGoal.center.y = self.view.frame.midY + 30
            self.actualBudgetGoal.alpha = 1.0
        }, completion: {
            finished in
        })
//        UIView.animate(withDuration: 0.5, delay: 3.3, options: .curveEaseInOut, animations: {
//            self.moneyAvailableLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//        }, completion: {
//            finished in
//        })
//        UIView.animate(withDuration: 0.5, delay: 4.0, options: .curveEaseInOut, animations: {
//            self.moneyAvailableLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }, completion: {
//            finished in
//        })
        UIView.animate(withDuration: 0.8, delay: 4.7, options: .curveEaseInOut, animations: {
            self.icon.center.y = self.view.frame.midY + 112
            self.icon.alpha = 1.0
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.8, delay: 4.88, options: .curveEaseInOut, animations: {
            self.givenLabel.center.y = self.view.frame.midY + 175
            self.givenLabel.alpha = 1.0
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 0.9, delay: 5.4, options: .curveEaseInOut, animations: {
            self.nextButton.center.y = self.view.frame.midY + 288
            self.nextButton.alpha = 1.0
            self.saveAndQuitButton.center.y = self.view.frame.midY + 288
            self.saveAndQuitButton.alpha = 1.0
        }, completion: {
            finished in
        })
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        
        let budgetNumber = defaults.integer(forKey: "budgetCreation")
        let name = defaults.string(forKey: "name")
        var targetExpenseCost = 0
        var startBalance = 0
        var currentIncome = 0
        var incomeIndex = 0
        var house = 0
        var utilities = 0
        var bills = 0
        var tuition = 0
        var insurance = 0
        var car = 0
        var charity = 0
        var memberships = 0
        var other = 0
        var endDate = Date()
        var startingDate = Date()
        
        ProfileImage.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        saveAndQuitButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        
        if budgetNumber == 1 {
            targetExpenseCost = defaults.integer(forKey: "budget1Expense")
            startBalance = defaults.integer(forKey: "budget1StartingBalance")
            currentIncome = defaults.integer(forKey: "budget1ExpectedIncome")
            incomeIndex = defaults.integer(forKey: "budget1IncomeIndex")
            house = defaults.integer(forKey: "budget1House")
            utilities = defaults.integer(forKey: "budget1Utilities")
            bills = defaults.integer(forKey: "budget1Bills")
            tuition = defaults.integer(forKey: "budget1Tuition")
            insurance = defaults.integer(forKey: "budget1Insurance")
            car = defaults.integer(forKey: "budget1Car")
            memberships = defaults.integer(forKey: "budget1Memberships")
            charity = defaults.integer(forKey: "budget1Charity")
            other = defaults.integer(forKey: "budget1Other")
            endDate = defaults.object(forKey: "budget1EndDate") as! Date
            startingDate = defaults.object(forKey: "budget1StartingDate") as! Date
            
        } else if budgetNumber == 2 {
            targetExpenseCost = defaults.integer(forKey: "budget2Expense")
            startBalance = defaults.integer(forKey: "budget2StartingBalance")
            currentIncome = defaults.integer(forKey: "budget2ExpectedIncome")
            incomeIndex = defaults.integer(forKey: "budget2IncomeIndex")
            house = defaults.integer(forKey: "budget2House")
            utilities = defaults.integer(forKey: "budget2Utilities")
            bills = defaults.integer(forKey: "budget2Bills")
            tuition = defaults.integer(forKey: "budget2Tuition")
            insurance = defaults.integer(forKey: "budget2Insurance")
            car = defaults.integer(forKey: "budget2Car")
            memberships = defaults.integer(forKey: "budget2Memberships")
            charity = defaults.integer(forKey: "budget2Charity")
            other = defaults.integer(forKey: "budget2Other")
            endDate = defaults.object(forKey: "budget2EndDate") as! Date
            startingDate = defaults.object(forKey: "budget2StartingDate") as! Date
            
        } else if budgetNumber == 3 {
            targetExpenseCost = defaults.integer(forKey: "budget3Expense")
            startBalance = defaults.integer(forKey: "budget3StartingBalance")
            currentIncome = defaults.integer(forKey: "budget3ExpectedIncome")
            incomeIndex = defaults.integer(forKey: "budget3IncomeIndex")
            house = defaults.integer(forKey: "budget3House")
            utilities = defaults.integer(forKey: "budget3Utilities")
            bills = defaults.integer(forKey: "budget3Bills")
            tuition = defaults.integer(forKey: "budget3Tuition")
            insurance = defaults.integer(forKey: "budget3Insurance")
            car = defaults.integer(forKey: "budget3Car")
            memberships = defaults.integer(forKey: "budget3Memberships")
            charity = defaults.integer(forKey: "budget3Charity")
            other = defaults.integer(forKey: "budget3Other")
            endDate = defaults.object(forKey: "budget3EndDate") as! Date
            startingDate = defaults.object(forKey: "budget3StartingDate") as! Date
            
        }
        

        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: startingDate)
        let date2 = calendar.startOfDay(for: endDate)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        let days = components.day
        let weeks = days! / 7
        
        if (incomeIndex == 0) {
            currentIncome = currentIncome * 4
        } else if (incomeIndex == 2) {
            currentIncome = currentIncome / 12
        }
        
        
        let targetSavingsWeekly = (targetExpenseCost - startBalance) / weeks
        let fixedExpenseValues = house + utilities + bills + tuition + insurance + car + memberships + charity + other
        let netIncomeAvailableWeekly = currentIncome - fixedExpenseValues
        let cashAvailableForOtherExpenses = netIncomeAvailableWeekly - targetSavingsWeekly
        print()
        print("TargetExpenseCost: ", targetExpenseCost)
        print("StartBalance: ", startBalance)
        print("Weeks: ", weeks)
        print ("Target Savings Weekly: ", targetSavingsWeekly)
        print ("Net Income Available Weekly: ", netIncomeAvailableWeekly)
        print ("Fixed Expense Value: ", fixedExpenseValues)
        print ("Cash Available for Other Expenses: ", cashAvailableForOtherExpenses)
        actualAmount.text = "$\(targetSavingsWeekly)"
        moneyAvailableLabel.text = "$\(cashAvailableForOtherExpenses)"
        actualBudgetGoal.text = "$\(targetExpenseCost)"
        
        
        if (cashAvailableForOtherExpenses < 0) {
            print("NOT POSSIBLE: Error in the numbers. Increase income or decrease expenses")
            currentBudgetState = BudgetState.NotPossible
            icon.tintColor = .red
            icon.image = UIImage(systemName: "xmark.circle.fill")
            givenLabel.text = "Budget not possible"
            currentBudgetState = BudgetState.NotPossible
            nextButton.setTitle("Revise", for: .normal)
        } else if (cashAvailableForOtherExpenses < 50) {
            print ("INCOME TOO LOW: Consider revising numbers, not sustainable")
            currentBudgetState = BudgetState.AdvismentNeeded
            icon.tintColor = UIColor(red: 248/255, green: 172/255, blue: 8/255, alpha: 1.0)
            icon.image = UIImage(systemName: "exclamationmark.triangle.fill")
            givenLabel.text = "Low funds: Consider Revising Budget"
            currentBudgetState = BudgetState.AdvismentNeeded
            nextButton.setTitle("Revise", for: .normal)
        } else {
            print ("Everything is ready to go!")
            currentBudgetState = BudgetState.BudgetReady
            icon.tintColor = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1.0)
            icon.image = UIImage(systemName: "checkmark.circle.fill")
            givenLabel.text = "Budget looks good!"
            currentBudgetState = BudgetState.BudgetReady
            nextButton.setTitle("Proceed", for: .normal)
        }
        
        if (currentBudgetState == BudgetState.BudgetReady) {
            nextButton.frame.size = CGSize(width: 200, height: 100)
            nextButton.center.x = self.view.frame.midX
            nextButton.setTitle("Save Budget", for: .normal)
            saveAndQuitButton.isHidden = true
        }
        
        
        ProfileImage.center.x = 0 - ProfileImage.frame.width
        nameLabel.center.x = 0 - nameLabel.frame.width
        amountToSaveWeekly.center.y = self.view.frame.midY
        actualAmount.center.y = self.view.frame.midY + 60
        fundsAvailableLabel.center.y = self.view.frame.height
        moneyAvailableLabel.center.y = self.view.frame.height
        budgetGoalLabel.center.y = self.view.frame.height + 130
        actualBudgetGoal.center.y = self.view.frame.height + 130
        icon.center.x = self.view.frame.midX
        givenLabel.center.x = self.view.frame.midX
        amountToSaveWeekly.center.x = self.view.frame.midX
        actualAmount.center.x = self.view.frame.midX
        fundsAvailableLabel.alpha = 0.0
        moneyAvailableLabel.alpha = 0.0
        amountToSaveWeekly.alpha = 0.0
        actualAmount.alpha = 0.0
        icon.alpha = 0.0
        nextButton.alpha = 0.0
        givenLabel.alpha = 0.0
        ProfileImage.alpha = 0.0
        budgetGoalLabel.alpha = 0.0
        actualBudgetGoal.alpha = 0.0
        saveAndQuitButton.alpha = 0.0
        moneyAvailableLabel.textAlignment = .right
        actualBudgetGoal.textAlignment = .right
        nameLabel.text = name
        icon.center.y = self.view.frame.midY + 350
        givenLabel.center.y = self.view.frame.midY + 300
        nextButton.center.y = self.view.frame.height + nextButton.frame.height
        saveAndQuitButton.center.y = self.view.frame.height + saveAndQuitButton.frame.height
        nextButton.isEnabled = true
        defaults.set(true, forKey: "hasBeenChanged")
        
        
        let delay1 = DispatchTime.now() + 0.1
        DispatchQueue.main.asyncAfter(deadline: delay1, execute: {
            self.openingAnimations()})
        
    }
}
